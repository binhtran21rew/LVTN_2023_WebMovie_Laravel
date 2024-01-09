<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RoomRequest;
use App\Http\Resources\RoomResource;
use App\Http\Resources\SeatResource;
use App\Models\Room;
use App\Models\Schedule;
use App\Models\Seat;
use Carbon\Carbon;
use Exception;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Psr\Http\Message\RequestInterface;

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


        if($rooms->count() > 0){
            foreach( $rooms as  $room){
                $data[] = new RoomResource($room);
            }
    
            return $data ;
        }

        return $rooms;
    }
    public function getRoom($id){
        $data = $this->room->load('seat')->find($id);
        return new RoomResource($data);
    }
    public function getAvailable(){
        $rooms = $this->room->where('status', '0')->get();

        return $rooms;
    }

    public function updateRoom(Request $request){
        $checkRoom = $this->room->find($request->id);
        if($checkRoom){
            
            $dataRoom = [
                'name' => $request->name,
                'status' => $request->status
            ];
         
            $checkRoom->update($dataRoom);
            
            return response()->json([
                'status' => 200,
                'message' => 'Updated successfully'
            ]);
        }

        return response()->json([
            'status' => 401,
            'message' => 'Room not found'
        ]);
    }
    public function changeRoom(Request $request){
        try{
            DB::beginTransaction();
            if($request->seats){
                foreach($request->seats as $key => $value){
                    $this->seat->where('id', $key)->update(['position' => $value]);
                }
            }
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Update position seat successfully !',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Update position seat failed !',
            ]);
        }

    }
    public function deleteRoom(Request $request){
        $today = Carbon::now()->toDateString();

        $isSoftDelete = $this->room->onlyTrashed()->find($request->id);
        $isSetSchedule = $this->room->with(['schedule' => function(Builder $query ) use($today){
            $query->where('date', '>=', $today);
        }])->find($request->id);
        if($isSoftDelete){
            if($request->type === 'delete'){
                try{
                    DB::beginTransaction();

                    $isSoftDelete->forceDelete();
                    DB::commit();
                    return response()->json([
                        'status' => 200,
                        'message' => 'Clear room successfully',
                    ]);
                }catch(Exception $e){
                    DB::rollBack();
                    return response()->json([
                        'status' => 401,
                        'message' => 'There was old schedule in room. Please delete it first to clear this room !',
                    ]);
                }

            }else{
                $isSoftDelete->restore();
                return response()->json([
                    'status' => 200,
                    'message' => 'Restore data successfully',
                ]);
            }

        }else{
            if($isSetSchedule->schedule->count() === 0){
                $checkid= $this->room->find($request->id);
                if(!$checkid){
                    return response()->json([
                        'status' => 401,
                        'message' => 'Id room not found',
                    ]);
                }
    
                $checkid->delete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Id room was deleted successfully',
                ]);
            }
            return response()->json([
                'status' => 401,
                'message' => 'The room is set schedule. Can not delete !',
            ]);
        }
    }

    public function getTrashed(){
        $rooms = $this->room->onlyTrashed()->get();
        if($rooms->count() > 0){
            foreach( $rooms as  $room){
                $data[] = new RoomResource($room);
            }

            return $data ;
        }

        return $rooms;

    }


    public function searchRoom(Request $request){
        $keyword = $request->keyword;
        
        $result = $this->room->load('seat')->where('name','like' ,'%'.$keyword.'%')->get();
        if($result->count() > 0){
            foreach($result as  $room){
                $data[] = new RoomResource($room);
            }
    
            return $data ;
        }else{

            return  $data = [] ;
        }

    }
}

