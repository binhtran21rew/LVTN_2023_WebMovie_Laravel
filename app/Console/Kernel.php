<?php

namespace App\Console;

use App\Http\Controllers\Api\MovieController;
use App\Models\Movie;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // $schedule->command('inspire')->hourly();
        $today = Carbon::now()->toDateString();
        $schedule->call(function() use ($today) {
            $data = DB::table('movies')
            ->join('movie_detail', 'movies.id', '=', 'movie_detail.movie_id')
            ->join('schedules', 'movies.id', '=', 'schedules.movie_id')
            ->select('movies.id', 'movie_detail.status', 'schedules.date')
            ->where('movie_detail.status', '0')
            ->where('schedules.date', $today)
            ->update(['movie_detail.status' => 1]);

            Cache::delete('movie_content_1');
        })->everySecond();
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
