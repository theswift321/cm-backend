<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class RazorpayWebhookController extends Controller
{
    public function handle(\Illuminate\Http\Request $request)
{
    Log::info('✅ Razorpay webhook hit');
    Log::info($request->getContent());

    return response()->json(['status' => 'ok'], 200);
}
}
