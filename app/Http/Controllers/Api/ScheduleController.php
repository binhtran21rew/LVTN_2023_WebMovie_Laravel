<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ScheduleRequest;
use App\Http\Resources\ScheduledResource;
use App\Models\Movie;
use App\Models\Room;
use App\Models\Schedule;
use Carbon\Carbon;

class ScheduleController extends Controller
{
    private $schedule;
    private $room;
    private $movie;
    public function __construct(Schedule $schedule, Room $room, Movie $movie){
        $this->schedule = $schedule;
        $this->room = $room;
        $this->movie = $movie;
    }
    public function createSchedule(ScheduleRequest $request){

        
        $checkRoom = $this->room->find($request->room_id);
        $checkMovie = $this->movie->find( $request->movie_id );
        $date = $request->date;

        $start = strtotime($request->time_start);
        $end = strtotime($checkMovie->time);
        $plus = strtotime('00:15:00');
        
        $setTimeEnd = gmdate("H:i:s",$start + $end + $plus);
        $setTimeStart= gmdate("H:i:s",$start + $plus);

        $checkSchedule = $this->schedule
            ->where('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeStart)
            ->where('time_end', '>=', $setTimeStart)

            ->orwhere('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeEnd)
            ->where('time_end', '>=', $setTimeEnd)

            ->orwhere('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeEnd)
            ->where('time_end', '>=', $setTimeStart)
            ->get()
            ->count();
        $getCheckSchedule = $this->schedule
            ->where('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeStart)
            ->where('time_end', '>=', $setTimeStart)

            ->orwhere('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeEnd)
            ->where('time_end', '>=', $setTimeEnd)

            ->orwhere('date', $date)
            ->where('room_id', $request->room_id)
            ->where('time_start', '<=', $setTimeEnd)
            ->where('time_end', '>=', $setTimeStart)
            ->get();

        if($checkRoom && $checkMovie){
            if($checkSchedule > 0){
                return response()->json([
                    'status' => 401,
                    'message' => 'The schedule has been set',
                    'data' => new ScheduledResource($getCheckSchedule[0])
                ]);
            }
            
            $data = $this->schedule::create([
                'room_id' => $request->room_id,
                'movie_id' => $request->movie_id,
                'date' => $request->date,
                'price' => $request->price,
                'time_start' => $setTimeStart,
                'time_end' => $setTimeEnd
            ]);

            return response()->json([
                'status' => 200,
                'message' => 'Create Scheduled Movie Success',
            ]);
        }

        return response()->json([
            'status' => 401,
            'message' => 'Room or movie not found',
        ]);
    }

    public function getAllSchedule(){
        $schedules =  $this->schedule->all();

        foreach($schedules as $schedule){
            $data[] = new ScheduledResource($schedule);
        }

        return $data;
    }
}

