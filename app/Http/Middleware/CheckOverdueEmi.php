<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\EmiPayment;
use Symfony\Component\HttpFoundation\Response;

class CheckOverdueEmi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        
        $userId = Auth::id();
        $courseId = $request->route('course'); // {course} from URL

        $overdueEmi = EmiPayment::where('user_id', $userId)
            ->where('course_id', $courseId)
            ->where('status', 'pending')
            ->where('due_date', '<', now())
            ->exists();

        if ($overdueEmi) {
            return response()->json([
                'message' => 'EMI overdue. Please complete payment to access this course.'
            ], 403);
        }

        return $next($request);
    }
}
