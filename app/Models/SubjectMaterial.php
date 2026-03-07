<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubjectMaterial extends Model
{
    use HasFactory;
    protected $table='subject_materials';

    protected $fillable = [
        'subject_id',
        'course_id',
        'title',
        'type',
        'content',
        'file_path',
        'order',
        'duration',
        'status'
    ];
    public function subject(){
        return $this->belongsTo(Subject::class);
    }
}
 