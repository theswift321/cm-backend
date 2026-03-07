<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{
      use HasFactory;

    protected $table = 'assignments';

    protected $fillable = [
        'subject_id',
        'title',
        'description',
        'submission_type',
        'file_path',
        'total_marks',
        'due_date'
    ];

    protected $casts = [
        'due_date' => 'datetime'
    ];

    protected $appends = ['file_url'];

    /**
     * Assignment → Submissions
     */
    public function submissions()
    {
        return $this->hasMany(AssignmentSubmission::class, 'assignment_id');
    }

    /**
     * File URL accessor
     */
    public function getFileUrlAttribute()
    {
        return $this->file_path
            ? asset('storage/' . $this->file_path)
            : null;
    }

    public function subject()
    {
        return $this->belongsTo(\App\Models\Subject::class, 'subject_id');
    }
}