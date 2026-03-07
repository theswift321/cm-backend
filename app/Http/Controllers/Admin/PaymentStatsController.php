<?php

namespace App\Http\Controllers\Admin;
use App\Models\Payment;
use App\Models\EmiPayment;
use Illuminate\Support\facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PaymentStatsController extends Controller
{
   public function summary()
    {
        $totalFullPayments = Payment::where('status', 'paid')->sum('amount');

        $totalEmiPayments = EmiPayment::where('status', 'paid')->sum('amount');

        $totalCollected = $totalFullPayments + $totalEmiPayments;

        $pendingEmiAmount = EmiPayment::where('status', 'pending')->sum('amount');

        return response()->json([
            'total_collected'      => $totalCollected,
            'full_payments'        => $totalFullPayments,
            'emi_payments'         => $totalEmiPayments,
            'pending_emi_amount'   => $pendingEmiAmount,
        ]);
    }

    public function byCourse()
{
    $full = Payment::select('course_id', DB::raw('SUM(amount) as total'))
        ->where('status', 'paid')
        ->groupBy('course_id');

    $emi = EmiPayment::select('course_id', DB::raw('SUM(amount) as total'))
        ->where('status', 'paid')
        ->groupBy('course_id');

    $combined = $full->unionAll($emi);

    return DB::table(DB::raw("({$combined->toSql()}) as payments"))
        ->mergeBindings($combined->getQuery())
        ->join('courses', 'courses.id', '=', 'payments.course_id')
        ->select(
            'payments.course_id',
            'courses.title as course_title',
            DB::raw('SUM(payments.total) as total')
        )
        ->groupBy('payments.course_id', 'courses.title')
        ->get();
}

    public function byStudent()
    {
        return Payment::selectRaw('user_id, SUM(amount) as total')
            ->where('status', 'paid')
            ->groupBy('user_id')
            ->with('user:id,name,email')
            ->get();
    }

}
