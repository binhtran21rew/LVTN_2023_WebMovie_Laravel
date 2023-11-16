<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RoomRequest;
use App\Http\Resources\RoomResource;
use App\Http\Resources\SeatResource;
use App\Models\Room;
use App\Models\Seat;
use Illuminate\Http\Request;

class RoomController extends Controller
{
    private $room;
    private $seat;
    public function __construct(Room $room, Seat $seat){
        $this->room = $room;
        $this->seat = $seat;
    }

    public function createRoom(RoomRequest $request){



        $checkRoom = $this->room->where('name', $request->name)->first();
        if($checkRoom){
            return response()->json([
                'status' => 401,
                'message' => 'Room name has already been',
            ]);

        }
        $dataRoom = $this->room->create([
            "name" => $request->name,
        ]);

        $dataSeat = array();

        for($i = 1; $i < $request->number_seat+1; $i++){
            $dataSeat[] = ["room_id" => $dataRoom['id'], "number" => $i];
        }

        $this->seat->insert( $dataSeat);
        return response()->json([
            'status' => 200,
            'message' => 'Create room successfully',
        ]);
    }

    public function getAll(){
        $rooms = $this->room->load('seat')->get();

        foreach( $rooms as  $room){
            $data[] = new RoomResource($room);
        }

        return $data ;
    }

    public function getAvailable(){
        $rooms = $this->room->where('status', '0')->get();

        return $rooms;
    }
}

