<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\CourseUser;
use App\Models\Course;
use Illuminate\Http\Request;

class EnrollmentController extends Controller
{
    public function enroll(Request $request)
    {
        $request->validate([
            'course_id' => 'required|exists:courses,id'
        ]);

        $user = $request->user();

        $alreadyEnrolled = CourseUser::where('user_id', $user->id)
            ->where('course_id', $request->course_id)
            ->where('status', 'enrolled')
            ->exists();

        if ($alreadyEnrolled) {
            return response()->json([
                'message' => 'Already enrolled'
            ], 409);
        }

        CourseUser::create([
            'user_id' => $user->id,
            'course_id' => $request->course_id,
            'status' => 'enrolled'
        ]);

        return response()->json([
            'message' => 'Enrollment successful'
        ]);
    }

    public function show($id)
    {
        $course = Course::with('category')->find($id);
        if (!$course) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Course not found'
                ],
                404
            );
        }
        $user = Auth::user();
        $isEnrolled = false;
        if ($user) {
            $isEnrolled = CourseUser::where('user_id', $user->id)->where('course_id', $course->id)->exists();
        }
        return response()->json(
            [
                'success' => true,
                'course' => $course,
                'isEnrolled' => $isEnrolled,
                'isLoggedIn' => $user ? true : false
            ]
        );
    }

   public function isenrolled($id){

            $course = Course::with('category')->find($id);

            $user = Auth::user();
            $isEnrolled = false;
        if ($user) {
            $isEnrolled = CourseUser::where('user_id', $user->id)->where('course_id', $course->id)->exists();
        } 
        return response()->json(
            [
                'success' => true,
                'course' => $course,
                'isEnrolled' => $isEnrolled,
                'isLoggedIn' => $user ? true : false
            ]
        );

    }
    

}