<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    protected $fillable = [
        'course_id',
        'title',
        'description',
        'start_time',
        'end_time',
        'duration',
        'is_active'
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }
    
}
