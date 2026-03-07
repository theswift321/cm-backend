<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseProgress extends Model
{
    use HasFactory;

     protected $table = 'course_progress';

    protected $fillable = [
        'student_id',
        'course_id',
        'completed_lessons',
        'total_lessons',
        'progress'
    ];

       protected $casts = [
        'progress' => 'float',
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }

    }
