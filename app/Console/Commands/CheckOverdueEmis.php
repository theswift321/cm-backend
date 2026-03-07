<?php

namespace App\Console\Commands;
use App\Models\EmiPayment;
use Illuminate\support\Facades\DB;

use Illuminate\Console\Command;

class CheckOverdueEmis extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:check-overdue-emis';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
          $overdueEmis = EmiPayment::where('status', 'pending')
        ->whereDate('due_date', '<', now())
        ->get();

    foreach ($overdueEmis as $emi) {

        // 🔒 Lock course
        DB::table('course_user')
            ->where('user_id', $emi->user_id)
            ->where('course_id', $emi->course_id)
            ->update([
                'status' => 'locked'
            ]);
    }
    }
}
