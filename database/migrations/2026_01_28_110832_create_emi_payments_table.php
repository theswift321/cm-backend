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
        Schema::create('emi_payments', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('course_id');

            $table->integer('installment_no');          
            $table->integer('total_installments');      

            $table->decimal('amount', 10, 2);
            $table->date('due_date');

            $table->enum('status', ['PAID', 'PENDING', 'OVERDUE'])
                  ->default('PENDING');

            $table->timestamp('paid_at')->nullable();
            $table->string('razorpay_payment_id')->nullable();

            $table->timestamps();

            // Optional but recommended
            $table->index(['student_id', 'course_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('emi_payments');
    }
};
