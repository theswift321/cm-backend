<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmiPayment extends Model
{
    use HasFactory;

    protected $table="emi_payments";
    protected $fillable = [
        'user_id',
        'course_id',
        'installment_no',
        'total_installments',
        'amount',
        'due_date',
        'status',
        'paid_at',
        'razorpay_payment_id',
        'razorpay_order_id'
    ];
}
