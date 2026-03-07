<?php

namespace App\Models;
use App\Models\Category;
use App\Models\Subject;
use App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $table='courses';

    protected $fillable=[
        'title',
        'description',
        'price',
        'category_id',
        'status',
        'minimum_payment', 
        'image' 
    ];

    protected $appends = ['image_url'];
    protected $casts = [
        'price' => 'float',
    ];

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function subjects(){
        return $this->hasMany(Subject::class)->orderBy('order');
    }

    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }

    public function assignments()
    {
        return $this->hasMany(Assignment::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class)
        ->withPivot('status')
        ->withTimestamps();
    }


    public function progress()
    {
        return $this->hasMany(CourseProgress::class);
    }
    // app/Models/Course.php


    public function getImageUrlAttribute()
    {
        return $this->image? asset('storage/' . $this->image): null;
    }

}
