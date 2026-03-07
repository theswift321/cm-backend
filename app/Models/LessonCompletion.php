<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LessonCompletion extends Model
{
    use HasFactory;
     public $timestamps = false;

     protected $table="lesson_completions";

    protected $fillable = [
        'student_id',
        'lesson_id',
        'completed_at'
    ];

        protected $casts = [
        'completed_at' => 'datetime',
    ];

    public function material()
    {
        return $this->belongsTo(SubjectMaterial::class, 'lesson_id');
    }

    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }
    
}
