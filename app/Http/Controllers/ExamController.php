<?php

namespace App\Http\Controllers;
use App\Models\ExamQuestion;
use Illuminate\Http\Request;
use App\Models\Exam;


class ExamController extends Controller
{
    public function store(Request $request)
        {
            $request->validate([
            'course_id' => 'required|exists:courses,id',
            'title' => 'required|string',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'duration' => 'required|integer'
            ]);

            $exam = Exam::create($request->all());

            return response()->json([
            'message' => 'Exam created successfully',
            'exam' => $exam
            ]);
    }

    public function show($id)
    {
        $exam = Exam::with('course')->findOrFail($id);

        return response()->json($exam);
    }

    public function update(Request $request,$id)
    {
        $exam = Exam::findOrFail($id);
        $exam->update($request->all());
        return response()->json([
            'message' => 'Exam updated successfully',
            'data' => $exam
        ]);
    }

    public function index()
    {
        $exams = Exam::with('course')->latest()->get();
        return response()->json($exams);
    }

    public function destroy($id)
    {
        $exam = Exam::findOrFail($id);
        $exam->delete();
        return response()->json([
            'message'=>'Exam deleted successfully'
        ]);
    }
    
     public function storeQuestion(Request $request)
    {
        $validated = $request->validate([
            'exam_id' => 'required|exists:exams,id',
            'question' => 'required|string',
            'option_a' => 'required|string',
            'option_b' => 'required|string',
            'option_c' => 'required|string',
            'option_d' => 'required|string',
            'correct_answer' => 'required|in:A,B,C,D'
        ]);

        $question = ExamQuestion::create($validated);

        return response()->json([
            'message' => 'Question added successfully',
            'data' => $question
        ],201);
    }

    public function getquestionlist($examId)
    {
        $questions = ExamQuestion::where('exam_id',$examId)->get();
        return response()->json($questions);
    }

    public function updateQuestion(Request $request, $id)
    {
        $request->validate([
            'question' => 'required|string',
            'option_a' => 'required|string',
            'option_b' => 'required|string',
            'option_c' => 'required|string',
            'option_d' => 'required|string',
            'correct_answer' => 'required|in:A,B,C,D',
        ]);

        $question = ExamQuestion::findOrFail($id);

        $question->update([
            'question' => $request->question,
            'option_a' => $request->option_a,
            'option_b' => $request->option_b,
            'option_c' => $request->option_c,
            'option_d' => $request->option_d,
            'correct_answer' => $request->correct_answer,
        ]);

        return response()->json([
            'message' => 'Question updated successfully',
            'data' => $question
        ]);
    }

    public function destroyQuestion($id)
    {
        $question = ExamQuestion::findOrFail($id);

        $question->delete();

        return response()->json([
            'message' => 'Question deleted successfully'
        ]);
    }


}