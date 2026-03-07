<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Assignment;
use App\Models\AssignmentSubmission;
use App\Models\CourseUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Course;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AssignmentController extends Controller
{
    /**
     * Create Assignment (Teacher)
     */
    public function storeAssignment(Request $request)
    {
        $request->validate([
            'subject_id'      => 'required|integer',
            'title'           => 'required|string|min:5',
            'description'     => 'required|string|min:10',
            'submission_type' => 'required|in:file,text,link,mixed',
            'total_marks'     => 'required|integer|min:1',
            'due_date'        => 'required|date|after:today',
            'document'        => 'nullable|file|mimes:pdf,doc,docx,ppt,pptx,zip|max:10240'
        ]);

        $path = null;
        if ($request->hasFile('document')) {
            $path = $request->file('document')->store('assignments', 'public');
        }

        $assignment = Assignment::create([
            'subject_id'      => $request->subject_id,
            'title'           => $request->title,
            'description'     => $request->description,
            'submission_type' => $request->submission_type,
            'total_marks'     => $request->total_marks,
            'due_date'        => $request->due_date,
            'file_path'       => $path
        ]);

        return response()->json([
            'message' => 'Assignment created successfully',
            'data' => $assignment
        ], 201);
    }

    /**
     * Get all assignments of a subject (Student)
     */
    public function getallSubjectAssignment($subjectId)
    {
        $assignments = Assignment::where('subject_id', $subjectId)
            ->with(['submissions' => function ($q) {
                $q->where('student_id', Auth::id());
            }])
            ->get();

        $assignments->each(function ($assignment) {
            if ($assignment->file_path) {
                $assignment->file_url = asset('storage/' . $assignment->file_path);
            }

            $submission = $assignment->submissions->first();
            if ($submission && $submission->file_path) {
                $submission->file_url = asset('storage/' . $submission->file_path);
            }
        });

        return response()->json(['data' => $assignments]);
    }


    public function getMyAssignmentsDashboard()
{
    $studentId = Auth::id();

    $courseIds = CourseUser::where('user_id', $studentId)
        ->pluck('course_id');

    $assignments = Assignment::whereHas('subject', function ($query) use ($courseIds) {
        $query->whereIn('course_id', $courseIds);
    })
    ->with(['subject.course', 'submissions' => function ($q) use ($studentId) {
        $q->where('student_id', $studentId);
    }])
    ->orderBy('due_date')
    ->get();

    $total = $assignments->count();

    $submitted = $assignments->filter(function ($assignment) {
        return $assignment->submissions->isNotEmpty();
    })->count();

    $reviewed = $assignments->filter(function ($assignment) {
        return $assignment->submissions->first()?->status === 'reviewed';
    })->count();

    return response()->json([
        'summary' => [
            'total' => $total,
            'submitted' => $submitted,
            'pending' => $total - $submitted,
            'reviewed' => $reviewed
        ],
        'assignments' => $assignments
    ]);
}

    /**
     * Submit / Update Assignment (Student)
     */
    public function submit(Request $request, $assignmentId)
    {
        $request->validate([
            'file' => 'nullable|file|mimes:pdf,doc,docx,zip|max:10240',
            'answer_text' => 'nullable|string',
            'submission_url' => 'nullable|url'
        ]);

        $path = null;
        if ($request->hasFile('file')) {
            $path = $request->file('file')->store('assignment_submissions', 'public');
        }

        $submission = AssignmentSubmission::updateOrCreate(
            [
                'assignment_id' => $assignmentId,
                'student_id' => Auth::id()
            ],
            [
                'file_path' => $path,
                'answer_text' => $request->answer_text,
                'submission_url' => $request->submission_url,
                'submitted_at' => now()
            ]
        );

        if ($submission->file_path) {
            $submission->file_url = asset('storage/' . $submission->file_path);
        }

        return response()->json([
            'message' => 'Assignment submitted successfully',
            'submission' => $submission
        ]);
    }

    /**
     * Update Assignment (Teacher)
     */
    public function update(Request $request, $id)
    {
        $assignment = Assignment::findOrFail($id);

        $request->validate([
            'title'           => 'required|string|min:5',
            'description'     => 'nullable|string',
            'total_marks'     => 'required|integer|min:1',
            'due_date'        => 'required|date',
            'submission_type' => 'required|in:file,text,link,mixed',
            'document'        => 'nullable|file|max:10240'
        ]);

        if ($request->hasFile('document')) {
            $path = $request->file('document')->store('assignments', 'public');
            $assignment->file_path = $path;
        }

        $assignment->update($request->except('document'));

        return response()->json([
            'message' => 'Assignment updated successfully',
            'data' => $assignment
        ]);
    }

    /**
     * Delete Assignment (Teacher)
     */
    public function destroy($id)
    {
        Assignment::findOrFail($id)->delete();

        return response()->json([
            'message' => 'Assignment deleted successfully'
        ]);
    }

    public function getSubmissions($assignmentId)
{
    $submissions = AssignmentSubmission::with('student')
        ->where('assignment_id', $assignmentId)
        ->orderBy('submitted_at', 'desc')
        ->get();

    return response()->json($submissions);
}

    public function reviewSubmission(Request $request, $id)
{
    $request->validate([
        'feedback' => 'nullable|string',
        'marks' => 'nullable|integer',
        'status' => 'required|in:reviewed,rejected'
    ]);

    $submission = AssignmentSubmission::findOrFail($id);

    $submission->feedback = $request->feedback;
    $submission->marks = $request->marks;
    $submission->status = $request->status;
    $submission->reviewed_at = now();
    $submission->save();

    return response()->json([
        'message' => 'Submission reviewed successfully'
    ]);
}

    public function assignmentStats(){
        /** @var \App\Models\User $student */
        $student = auth()->user();

        // Get enrolled course IDs only
        $courseIds = $student->courses()
            ->wherePivot('status', 'enrolled')
            ->pluck('courses.id');

        // Total assignments from those courses
        $totalAssignments = Assignment::whereIn('course_id', $courseIds)->count();

        // Submitted assignments (only for those courses)
        $submittedCount = AssignmentSubmission::where('student_id', $student->id)
            ->whereIn('assignment_id', function ($query) use ($courseIds) {
                $query->select('id')
                    ->from('assignments')
                    ->whereIn('course_id', $courseIds);
            })
            ->count();

        return response()->json([
            'total' => $totalAssignments,
            'submitted' => $submittedCount,
            'pending' => $totalAssignments - $submittedCount,
        ]);
    }

public function studentAssignments()
{
    /** @var \App\Models\User $student */
    $student = auth()->user();

    // Get enrolled course IDs
    $courseIds = $student->courses()
        ->wherePivot('status', 'enrolled')
        ->pluck('courses.id');

    // Get assignments through subjects
    $assignments = Assignment::whereHas('subject', function ($query) use ($courseIds) {
        $query->whereIn('course_id', $courseIds);
    })
    ->with(['submissions' => function ($query) use ($student) {
        $query->where('student_id', $student->id);
    }])
    ->orderBy('due_date')
    ->get();

    return response()->json([
        'data' => $assignments
    ]);
}

}
