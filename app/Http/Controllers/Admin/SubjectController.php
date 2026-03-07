<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subject;
use App\Models\Course;

class SubjectController extends Controller
{
    public function index($courseId){
        return Subject::Where('course_id',$courseId)->orderBy('order')->get();
    }

    public function store(Request $request,$courseId){
        $data=$request->validate([
            'title'=>'required|string',
            'order'=>'required|integer',
            'status'=>'required|in:active,inactive'
            ]);
    
            $data['course_id']=$courseId;

            return Subject::create($data);
        }

    public function show(Subject $subject){
        return $subject;
    }
    public function update(Request $request,Subject $subject){
        $data=$request->validate([
            'title'=>'required|string',
            'order'=>'required|integer',
            'status'=>'in:active,inactive'
        ]);

        $subject->update($data);
        return $subject;
    }

    public function destroy($id){
    $subject = Subject::find($id);

    if (!$subject) {
        return response()->json([
            'message' => 'Subject not found'
        ], 404);
    }

    $subject->delete();
    return response()->json([
        'message' => 'Subject deleted'
    ], 200);
    }

    public function getsubjectbyId($subjectId, $courseId){
     $courseName= Course::where('Id',$courseId)->value('title');
     $subjectName= Subject::where('Id',$subjectId)->value('title');
     
     return response()->json([
        'courseName'=>$courseName,
        'subjectName'=>$subjectName
        ]);
     }

     

}
