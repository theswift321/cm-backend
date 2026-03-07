<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;

    protected $fillable = [
        'course_id',
        'title',
        'order',
        'status'
    ];

    public function course(){
        return $this->belongsTo(Course::class);
    }
    public function materials()
{
    return $this->hasMany(SubjectMaterial::class)->orderBy('order');
}
}
