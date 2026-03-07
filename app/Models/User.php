<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
    'name',
    'email',
    'password',
    'role',
    'phone',
    'photo',
    'google_id'
];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
    
    public function courses()
    {
    return $this->belongsToMany(Course::class)
                ->withPivot('status')
                ->withTimestamps();
    }

 public function isEnrolledInCourse($courseId): bool
    {

        return $this->courses()
            ->where('course_id', $courseId)
            ->wherePivot('status', 'enrolled')
            ->exists();
    }

    public function submissions()
{
    return $this->hasMany(AssignmentSubmission::class, 'student_id');
}
}
