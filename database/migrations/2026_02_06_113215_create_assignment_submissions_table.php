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
        Schema::create('assignment_submissions', function (Blueprint $table) {
             $table->id();

            $table->unsignedBigInteger('assignment_id');
            $table->unsignedBigInteger('student_id');

            $table->string('file_path')->nullable();
            $table->longText('answer_text')->nullable();
            $table->string('submission_url')->nullable();

            $table->integer('marks')->nullable();
            $table->text('feedback')->nullable();

            $table->timestamp('submitted_at')->nullable();

            $table->timestamps();

            $table->foreign('assignment_id')
                  ->references('id')
                  ->on('assignments')
                  ->onDelete('cascade');

            $table->foreign('student_id')
                  ->references('id')
                  ->on('users')
                  ->onDelete('cascade');

            // one submission per student per assignment
            $table->unique(['assignment_id', 'student_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assignment_submissions');
    }
};
