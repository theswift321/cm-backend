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
        Schema::create('assignments', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('subject_id');

            $table->string('title');
            $table->text('description')->nullable();

            $table->enum('submission_type', ['file', 'text', 'link', 'mixed'])
                  ->default('file');

            $table->integer('total_marks')->default(0);
            $table->dateTime('due_date')->nullable();

            $table->timestamps();

            $table->foreign('subject_id')
                  ->references('id')
                  ->on('subjects')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assignments');
    }
};
