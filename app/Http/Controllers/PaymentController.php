<?php

namespace App\Http\Controllers;
use App\Models\EmiPayment;

use Illuminate\Http\Request;
use Razorpay\Api\Api;
use App\Models\Course;
use App\Models\Payment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;


class PaymentController extends Controller
{
    /**
     * Create Razorpay Order
     */
    public function createOrder(Request $request)
    {
    try {
    $request->validate([
    'courseId' => 'required|exists:courses,id',
    'paymentType' => 'required|in:full,emi',
    'emiMonths' => 'nullable|integer|min:2'
    ]);

    $course = Course::findOrFail($request->courseId);

    $api = new Api(
    config('services.razorpay.key'),
    config('services.razorpay.secret')
    );

    // 🔹 Initialize variables
    $installmentNo = null;
    $totalInstallments = null;

    /* ---------------- FULL PAYMENT ---------------- */
    if ($request->paymentType === 'full') {
    $amount = $course->price;
    }
    /* ---------------- EMI PAYMENT ---------------- */
    else {
    $totalInstallments = $request->emiMonths;
    $installmentNo = 1; // first EMI at checkout
    $amount = round($course->price / $totalInstallments, 2);

    // 🔹 CREATE EMI ROWS for all installments
    // for ($i = 1; $i <= $totalInstallments; $i++) {
    //     EmiPayment::create([
    //         'user_id' => auth()->id(), // must match your table column
    //         'course_id' => $course->id,
    //         'installment_no' => $i,
    //         'total_installments' => $totalInstallments,
    //         'amount' => $amount,
    //         'due_date' => now()->addMonths($i),
    //         'status' => 'pending', // all EMIs pending initially
    //     ]);
    // }
    }

    // 🔹 CREATE RAZORPAY ORDER for the current payment
    $razorpayOrder = $api->order->create([
    'receipt' => 'rcpt_' . time(),
    'amount' => $amount * 100, // convert to paise
    'currency' => 'INR'
    ]);

    // 🔹 SAVE PAYMENT
    Payment::create([
    'user_id' => auth()->id(),
    'course_id' => $course->id,
    'razorpay_order_id' => $razorpayOrder->id,
    'amount' => $amount,
    'installment_no' => $installmentNo,
    'total_installments' => $totalInstallments,
    'payment_type' => $request->paymentType,
    'emi_months' => $request->paymentType === 'emi' ? $totalInstallments : null,
    'status' => 'created'
    ]);

    return response()->json([
    'success' => true,
    'key' => config('services.razorpay.key'),
    'amount' => $razorpayOrder->amount,
    'order_id' => $razorpayOrder->id
    ]);

    } catch (\Exception $e) {
    Log::error('Razorpay createOrder error', [
    'error' => $e->getMessage()
    ]);

    return response()->json([
    'success' => false,
    'message' => $e->getMessage()
    ], 500);
    }
    }

    

    public function verify(Request $request)
    {
    $request->validate([
    'razorpay_order_id' => 'required',
    'razorpay_payment_id' => 'required',
    'razorpay_signature' => 'required'
    ]);

    $payment = Payment::where(
    'razorpay_order_id',
    $request->razorpay_order_id
    )->first();

    if (!$payment) {
    return response()->json([
    'success' => false,
    'message' => 'Order not found'
    ], 400);
    }

    $api = new Api(
    config('services.razorpay.key'),
    config('services.razorpay.secret')
    );

    try {
    $api->utility->verifyPaymentSignature([
    'razorpay_order_id' => $request->razorpay_order_id,
    'razorpay_payment_id' => $request->razorpay_payment_id,
    'razorpay_signature' => $request->razorpay_signature,
    ]);

    DB::transaction(function () use ($payment, $request) {

    $payment->update([
        'razorpay_payment_id' => $request->razorpay_payment_id,
        'razorpay_signature' => $request->razorpay_signature,
        'status' => 'paid'
    ]);

    if ($payment->installment_no === 1 && $payment->total_installments) {
        $this->createEmiSchedule(
        $payment,
        $request->razorpay_payment_id
        );
    }
    // Enroll if FULL payment OR first EMI
    $shouldEnroll =
        $payment->installment_no === null ||
        $payment->installment_no === 1;

    if ($shouldEnroll) {
        DB::table('course_user')->updateOrInsert(
            [
                'user_id' => $payment->user_id,
                'course_id' => $payment->course_id,
            ],
            [
                'status' => 'enrolled',
                'amount_paid' => $payment->amount,
                'updated_at' => now(),
                'created_at' => now(),
            ]
        );
    }
    });

    return response()->json([
    'success' => true,
    'message' => 'Payment verified successfully'
    ]);

    } catch (\Exception $e) {
    Log::error('Razorpay Verify Failed', [
    'error' => $e->getMessage(),
    'payload' => $request->all()
    ]);

    return response()->json([
    'success' => false,
    'message' => 'Payment verification failed'
    ], 400);
    }
    }

    private function createEmiSchedule(Payment $payment,string $razorpayPaymentId) {
    $totalInstallments = $payment->total_installments;
    $emiAmount = $payment->amount;

    // 1️⃣ First EMI (PAID)
    EmiPayment::create([
    'user_id' => $payment->user_id,
    'course_id' => $payment->course_id,
    'installment_no' => 1,
    'total_installments' => $totalInstallments,
    'amount' => $emiAmount,
    'due_date' => now(),
    'status' => 'PAID',
    'paid_at' => now(),
    'razorpay_payment_id' => $razorpayPaymentId
    ]);

    // 2️⃣ Remaining EMIs (PENDING)
    for ($i = 2; $i <= $totalInstallments; $i++) {
    EmiPayment::create([
    'user_id' => $payment->user_id,
    'course_id' => $payment->course_id,
    'installment_no' => $i,
    'total_installments' => $totalInstallments,
    'amount' => $emiAmount,
    'due_date' => now()->addDays(30 * ($i - 1)),
    'status' => 'PENDING'
    ]);
    }
    }

    public function createNextEmiOrder(Request $request)
    {

        $request->validate([
            'emi_id' => 'required|exists:emi_payments,id'
        ]);


        $emi = EmiPayment::findOrFail($request->emi_id);


        if($emi->status === 'paid')
        {
            return response()->json([
                'message'=>'Already paid'
            ],400);
        }


        $api = new Api(
            config('services.razorpay.key'),
            config('services.razorpay.secret')
        );


        $order = $api->order->create([
            'receipt' => 'emi_'.$emi->id,
            'amount' => $emi->amount * 100,
            'currency' => 'INR'
        ]);
     
        // ✅ SAVE ORDER ID HERE
        $emi->update([
            'razorpay_order_id' => $order->id,
        ]);

        return response()->json([
            'key'=>config('services.razorpay.key'),
            'amount'=>$order->amount,
            'currency'=>'INR',
            'order_id'=>$order->id
        ]);

    }

    public function verifyEmiPayment(Request $request)
    {
    $request->validate([
    'razorpay_order_id'=>'required',
    'razorpay_payment_id'=>'required',
    'razorpay_signature'=>'required'
    ]);

    $emi = EmiPayment::where(
    'razorpay_order_id',
    $request->razorpay_order_id
    )->firstOrFail();

    $api = new Api(
    config('services.razorpay.key'),
    config('services.razorpay.secret')
    );

    $api->utility->verifyPaymentSignature([
    'razorpay_order_id'=>$request->razorpay_order_id,
    'razorpay_payment_id'=>$request->razorpay_payment_id,
    'razorpay_signature'=>$request->razorpay_signature,
    ]);

    $emi->update([

    'status'=>'paid',
    'razorpay_payment_id'=>$request->razorpay_payment_id,
    'paid_at'=>now()

    ]);

    return response()->json([
    'success'=>true
    ]);
    }

    public function studentPaymentStatus($courseId)
    {
    $studentId = auth()->id();

    // Full payment
    $fullPayment = Payment::where('user_id', $studentId)
    ->where('course_id', $courseId)
    ->where('status', 'paid')
    ->first();

    // EMI payments
    $emis = EmiPayment::where('user_id', $studentId)
    ->where('course_id', $courseId)
    ->orderBy('installment_no')
    ->get();

    $paidEmiCount = $emis->where('status', 'paid')->count();

    $totalEmi = $emis->count();

    $totalPaidAmount = $emis->where('status','paid')->sum('amount');

    $pendingAmount = $emis->where('status','pending')->sum('amount');

    return response()->json([

    'is_full_paid' => $fullPayment ? true : false,

    'total_emi' => $totalEmi,

    'paid_emi' => $paidEmiCount,

    'total_paid_amount' => $totalPaidAmount,

    'pending_amount' => $pendingAmount,

    'emis' => $emis

    ]);
    }

    public function getMyEmi($courseId)
    {
    $studentId = auth()->id();
    //  echo"<pre>";
    //         print_r($studentId);
    //         exit();
    $emis = EmiPayment::where('user_id', $studentId)
    ->where('course_id', $courseId)
    ->orderBy('installment_no')
    ->get();



    return response()->json($emis);
    }

}
