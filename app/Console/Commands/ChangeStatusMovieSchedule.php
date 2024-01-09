<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ChangeStatusMovieSchedule extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:change-status-movie-schedule';

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
        $today = Carbon::now()->toDateString();
        $data = DB::table('movies')
        ->join('movie_detail', 'movies.id', '=', 'movie_detail.movie_id')
        ->join('schedules', 'movies.id', '=', 'schedules.movie_id')
        ->select('movies.id', 'movie_detail.status', 'schedules.date')
        ->where('movie_detail.status', '0')
        ->where('schedules.date', $today)
        ->update(['movie_detail.status' => 1]);

        Log::info($data);
    }
}
