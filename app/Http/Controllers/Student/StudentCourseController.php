<?php

namespace App\Http\Controllers\student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SubjectMaterial;
use App\Models\EmiPayment;
// use App\Models\User;
use App\Models\User;
// use Illuminate\Foundation\Auth\User;

class StudentCourseController extends Controller
{
    public function myCourses(Request $request)
{
    $user = $request->user();

    $courses = $user->courses()
        ->withPivot('status') // include pivot status
        ->get()
        ->map(function ($course) use ($user) {

            // ✅ Get all EMIs for this course
            $emis = EmiPayment::where('user_id', $user->id)
                ->where('course_id', $course->id)
                ->orderBy('installment_no')
                ->get(['id','installment_no','amount','status','due_date']);

            $course->emis = $emis; // attach all EMIs
            $course->next_emi = $emis->firstWhere('status', 'pending'); // optional for first pending EMI

            return $course;
        });

    return response()->json([
        'success' => true,
        'data' => $courses
    ]);
}



    public function studyMaterial($courseId, $materialId)
{
    /** @var \App\Models\User $user */
    // $user = auth()->user();
     $user = auth()->user();

    // 🔐 enrollment check (CORRECT)
    if (!$user->isEnrolledInCourse($courseId)) {
        return response()->json(['message' => 'Forbidden'], 403);
    }

     
    $material = SubjectMaterial::where('id', $materialId)
        ->whereHas('subject', function ($q) use ($courseId) {
            $q->where('course_id', $courseId);
        })
        ->firstOrFail();

   return response()->json([
        'material' => [
            'id' => $material->id,
            'title' => $material->title,
            'content' => $material->content,
            'type' => $material->type,
            'file_url' => $material->file_path
                ? asset('storage/' . $material->file_path)
                : null,
        ],
        'subject' => [
            'id' => $material->subject->id,
            'title' => $material->subject->title,
        ],
        'materials' => $material->subject->materials->map(fn ($m) => [
            'id' => $m->id,
            'title' => $m->title,
            'type' => $m->type,
            'duration' => $m->duration,
        ])
    ]);
}




}
