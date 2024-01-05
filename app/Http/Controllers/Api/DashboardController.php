<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Movie;
use App\Models\Schedule;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class DashboardController extends Controller
{
    private $user;
    private $movie;
    private $schedule;
    public function __construct(User $user, Movie $movie, Schedule $schedule){
        $this->user = $user;
        $this->movie = $movie;
        $this->schedule = $schedule;
    }

    public function dashboardAccount(){
        $user= $this->user->all();
        foreach($user as $a){
            if($a->hasExactRoles('user')){
                $result[] = $a;
            }
        }
        return  $result;
    }

    public function dashboardMovie(){
        $result = $this->movie->all()->count();
        return $result;
    }

    public function dashboardSchedule(){
        $today = Carbon::today()->format('Y-m-d');
        $time = Carbon::now()->tz('Asia/Ho_Chi_Minh')->format('h:i:s');

        $result = $this->schedule->with('room')->where('date', '>=', $today)->where('time_start', '>=', $time)->get();
        return $result;



    }
}
