<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ScheduleRequest;
use App\Http\Resources\CalendarFormat;
use App\Http\Resources\ScheduledResource;
use App\Models\Movie;
use App\Models\Room;
use App\Models\Schedule;
use App\Models\Seat;
use App\Models\Ticket;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ScheduleController extends Controller
{
    private $schedule;
    private $room;
    private $movie;
    private $ticket;
    private $seat;
    public function __construct(Schedule $schedule, Room $room, Movie $movie, Ticket $ticket, Seat $seat){
        $this->schedule = $schedule;
        $this->room = $room;
        $this->movie = $movie;
        $this->ticket = $ticket;
        $this->seat = $seat;
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

            $scheduledata = $this->schedule::create([
                'room_id' => $request->room_id,
                'movie_id' => $request->movie_id,
                'date' => $request->date,
                'price' => $request->price,
                'time_start' => $setTimeStart,
                'time_end' => $setTimeEnd,
                'status' => 0
            ]);
            if($scheduledata){
                $seatData = array();
                $seat = $this->seat->where('room_id', $request->room_id)->get();
                for($i = 0; $i < sizeof($seat); $i++){
                    $dataSeat[] = ["seat_id" => $seat[$i]['id'], "schedule_id" => $scheduledata['id'], 'status' => 0];
                }
                $this->ticket->insert($dataSeat);
            }
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
        $schedules = $this->schedule->load(['room', 'movie'])->get();

        foreach($schedules as $schedule){
            $data[] = new ScheduledResource($schedule);
        }
        return $data;
    }

    public function getSchedule($room){
        $schedules = $this->schedule->with('movie')->where('room_id', $room)->get();
        if(sizeof($schedules) > 0){
            foreach($schedules as $schedule){
                $data[] = new CalendarFormat($schedule);
            }
            return $data;
        }
        return $schedules;
    }


    public function updateSchedule(Request $request){
        $checkScheduleId = $this->schedule->find($request->schedule_id);
        $checkMovie = $this->movie->find( $request->movie_id );
        if($checkScheduleId && $checkMovie){
            $date = $request->date;

            $start = strtotime($request->time_start);
            $end = strtotime($checkMovie->time);
            
            $setTimeEnd = gmdate("H:i:s",$start + $end);
            $setTimeStart= gmdate("H:i:s",$start);
            $checkSchedule = $this->schedule
                ->where('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeStart)
                ->where('time_end', '>=', $setTimeStart)

                ->orwhere('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeEnd)
                ->where('time_end', '>=', $setTimeEnd)

                ->orwhere('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeEnd)
                ->where('time_end', '>=', $setTimeStart)
                ->get()
                ->count();
            $getCheckSchedule = $this->schedule
                ->where('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeStart)
                ->where('time_end', '>=', $setTimeStart)
    
                ->orwhere('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeEnd)
                ->where('time_end', '>=', $setTimeEnd)
    
                ->orwhere('id', '<>', $request->schedule_id)
                ->where('date', $date)
                ->where('room_id', $request->room_id)
                ->where('time_start', '<=', $setTimeEnd)
                ->where('time_end', '>=', $setTimeStart)
                ->get();
            if($checkSchedule > 0){
                return response()->json([
                    'status' => 401,
                    'message' => 'The schedule has been set',
                    'data' => new ScheduledResource($getCheckSchedule[0])
                ]);
            }
            $dataSchedule = [
                'room_id' => $request->room_id,
                'movie_id' => $request->movie_id,
                'date' => $request->date,
                'price' => $request->price,
                'time_start' => $setTimeStart,
                'time_end' => $setTimeEnd,
                'status' => 1
            ];
            $checkScheduleId->update($dataSchedule);

            return response()->json([
                'status' => 200,
                'message' => 'Update Scheduled Movie Success',
            ]);
        }

        return  response()->json([
            'status' => 401,
            'message' => 'Schedule not found'
        ]);
    }



    public function getBookingSchedule($movie){

        $today = Carbon::now()->toDateString();

        if($movie === "DEFAULT"){
            return [];
        }

        $checkSchedule = $this->schedule->load('movie')->where('movie_id', $movie)->where('date', '>=', $today)->where('status', 0)->get();
        return $checkSchedule;
    }


    public function getTicket($schedule){
        $checkSchedule = $this->schedule->with(['movie', 'ticket.seat'])->find($schedule);

        return new ScheduledResource($checkSchedule);
    }
}

