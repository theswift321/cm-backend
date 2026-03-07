<?php

namespace App\Http\Controllers;

use App\Models\LessonCompletion;
use App\Models\SubjectMaterial;
use App\Models\Lesson;
use App\Models\EmiPayment;
use App\Models\CourseProgress;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LessonController extends Controller
{

    public function complete($lessonId)
{
    $studentId = auth()->id();

    // find material
    $material = SubjectMaterial::findOrFail($lessonId);
    $courseId = $material->course_id;

    // total lessons in course
    $totalLessons = SubjectMaterial::where('course_id', $courseId)->count();

    // completed lessons
    $completedLessons = LessonCompletion::where('student_id', $studentId)
        ->whereIn(
            'lesson_id',
            SubjectMaterial::where('course_id', $courseId)->pluck('id')
        )->count();


    // ✅ GET EMI INFO

    $paidEmiCount = EmiPayment::where('user_id', $studentId)
        ->where('course_id', $courseId)
        ->where('status', 'paid')
        ->count();


    $totalInstallments = EmiPayment::where('user_id', $studentId)
        ->where('course_id', $courseId)
        ->value('total_installments');


    // if full payment OR no EMI restriction
    if (!$totalInstallments) {
        $allowedLessons = $totalLessons;
    } else {
        $allowedLessons = floor(
            ($paidEmiCount / $totalInstallments) * $totalLessons
        );
    }


    // 🚨 BLOCK CONDITION

    if ($completedLessons >= $allowedLessons) {

        return response()->json([
            'message' => 'Please pay next EMI to continue course',
            'allowed_lessons' => $allowedLessons
        ], 403);
    }


    // ✅ SAVE completion

    LessonCompletion::firstOrCreate([
        'student_id' => $studentId,
        'lesson_id'  => $lessonId
    ]);


    $completedLessons++;


    // calculate progress
    $progress = $totalLessons > 0
        ? round(($completedLessons / $totalLessons) * 100, 2)
        : 0;


    CourseProgress::updateOrCreate(
        [
            'student_id' => $studentId,
            'course_id'  => $courseId
        ],
        [
            'completed_lessons' => $completedLessons,
            'total_lessons'     => $totalLessons,
            'progress'          => $progress
        ]
    );


    return response()->json([
        'message'  => 'Material completed',
        'progress' => $progress
    ]);
}


    public function getProgress($courseId)
{
    $studentId = auth()->id();

    $totalLessons = Lesson::where('course_id', $courseId)->count();

    $completedLessons = LessonCompletion::where('student_id', $studentId)
        ->whereIn('lesson_id', Lesson::where('course_id', $courseId)->pluck('id'))
        ->count();

    // $progress = $totalLessons > 0
    //     ? round(($completedLessons / $totalLessons) * 100, 2)
    //     : 0;

    $progress=CourseProgress::where('course_id',$courseId)->get('progress');

    return response()->json([
        'course_id' => $courseId,
        'completed_lessons' => $completedLessons,
        'total_lessons' => $totalLessons,
        'progress' => $progress
    ]);
}
}
