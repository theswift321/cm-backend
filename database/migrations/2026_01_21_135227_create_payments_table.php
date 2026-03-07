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
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')
                  ->constrained()
                  ->cascadeOnDelete();

            $table->foreignId('course_id')
                  ->constrained()
                  ->cascadeOnDelete();

            // Razorpay fields
            $table->string('razorpay_order_id')->unique();
            $table->string('razorpay_payment_id')->nullable();
            $table->string('razorpay_signature')->nullable();

            // Payment info
            $table->decimal('amount', 8, 2);
            $table->enum('payment_type', ['full', 'emi'])->default('full');
            $table->integer('emi_months')->nullable();

            $table->enum('status', ['created', 'paid', 'failed'])->default('created');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
