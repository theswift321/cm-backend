<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CourseController extends Controller
{
    /* =======================
        CREATE COURSE
    ======================== */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'price' => 'required|numeric',
            'category_id' => 'required',
            'status' => 'required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        $imagePath = null;

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('courses', 'public');
        }

        $course = Course::create([
            'title' => $request->title,
            'description' => $request->description,
            'price' => $request->price,
            'minimum_payment' => $request->minimum_payment ?? 0,
            'category_id' => $request->category_id,
            'status' => $request->status,
            'image' => $imagePath
        ]);

        return response()->json($course, 201);
    }

    /* =======================
        UPDATE COURSE
    ======================== */
    public function update(Request $request, $id)
    {
        $course = Course::findOrFail($id);

        $request->validate([
            'title' => 'sometimes|required|string|max:255',
            'price' => 'sometimes|required|numeric',
            'minimum_payment' => $request->minimum_payment, // ✅ ADD THIS
            'category_id' => 'sometimes|required',
            'description' => 'nullable|string',
            'status' => 'sometimes|required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        /* IMAGE UPDATE */
        if ($request->hasFile('image')) {

            if ($course->image && Storage::disk('public')->exists($course->image)) {
                Storage::disk('public')->delete($course->image);
            }

            $course->image = $request->file('image')->store('courses', 'public');
        }

        if ($request->has('title')) {
            $course->title = $request->title;
        }

        if ($request->has('description')) {
            $course->description = $request->description;
        }

        if ($request->has('price')) {
            $course->price = $request->price;
        }

        if ($request->has('category_id')) {
            $course->category_id = $request->category_id;
        }

        if ($request->has('status')) {
            $course->status = $request->status;
        }

        $course->save();

        return response()->json($course);
    }

    /* =======================
        GET COURSE BY ID
    ======================== */
    public function getdataById($id)
    {
        return Course::findOrFail($id);
    }

    /* =======================
        LIST COURSES
    ======================== */
    public function index()
    {
        return Course::all();
    }

    /* =======================
        DELETE COURSE
    ======================== */
    public function destroy($id)
    {
        $course = Course::findOrFail($id);

        if ($course->image && Storage::disk('public')->exists($course->image)) {
            Storage::disk('public')->delete($course->image);
        }

        $course->delete();

        return response()->json(['message' => 'Deleted']);
    }

    /* =======================
        LANDING PAGE COURSES
    ======================== */
    public function landingindex()
    {
        return Course::with('category','subjects.materials')->get();
    }


    public function publicShow($id)
    {
        return Course::with([
            'category:id,name',
            'subjects' => function ($q) {
                $q->select('id', 'course_id', 'title', 'order', 'status')
                ->with([
                    'materials' => function ($mq) {
                        $mq->select(
                            'id',
                            'subject_id',
                            'title',
                            'type',
                            'content',
                            'order',
                            'duration',
                            'status'
                        );
                    }
                ]);
            }
        ])
        ->where('status', 'active')
        ->findOrFail($id);
    }
}
