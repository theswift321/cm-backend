<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Illuminate\Support\Facades\Auth;



class CourseCatalogController extends Controller
{
  public function index()
{
    $studentId = Auth::id();

    $courses = Course::where('status', 'active')
        ->select('id', 'title', 'description', 'price', 'minimum_payment', 'image')
        ->withCount([
            'users as is_enrolled' => function ($q) use ($studentId) {
                $q->where('user_id', $studentId);
            }
        ])
        ->get()
        ->map(function ($course) {
            $course->is_enrolled = $course->is_enrolled > 0;
            return $course;
        });

    return response()->json($courses);
}

}



