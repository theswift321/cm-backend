<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('course_progress', function (Blueprint $table) {
           $table->id();

    $table->unsignedBigInteger('student_id');
    $table->unsignedBigInteger('course_id');

    $table->integer('completed_lessons')->default(0);
    $table->integer('total_lessons')->default(0);

    $table->decimal('progress', 5, 2)->default(0); // %

    $table->timestamps();

    $table->unique(['student_id', 'course_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('course_progress');
    }
};
