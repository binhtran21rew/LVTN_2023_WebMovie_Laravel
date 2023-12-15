<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\TrailerRequest;
use App\Http\Resources\TrailerResource;
use App\Models\Movie;
use App\Models\Movie_detail;
use App\Models\Trailer;
use Exception;
use Illuminate\Http\Request;

class Trailers extends Controller
{
    private $movie;
    private $trailer;
    private $movie_detail;
    public function __construct(Movie $movie, Trailer $trailer, Movie_detail $movie_detail){
        $this->movie = $movie;
        $this->trailer = $trailer;
        $this->movie_detail = $movie_detail;
    }

    public function createTrailer(TrailerRequest $request){
        $checkMovie = $this->movie_detail->find($request->movie_id);
        $checkName = $this->trailer->where('key', $request->key)->first();
        if($checkMovie){
            if($checkName){
                return response()->json([
                    'status' => 401,
                    'message' => 'Trailer has already been',
                ]);
            }
            $dataTrailer = [
                "key" => $request->key,
                "movie_id" => $checkMovie->movie_id,
            ];
            $this->trailer->create($dataTrailer);

            return response()->json([
                'status' => 200,
                'message' => 'Created trailer successfully',
            ]);
        }
        return response()->json([
            'status' => 401,
            'message' => 'Id movie not found',
        ]);
    }

    public function getTrailer($id){
        $checkMovie = $this->movie->find($id);
        if($checkMovie){
            return $this->trailer->where('movie_id', $id)->first();
        }
    }

    public function getAllTrailer(){
        $trailers = $this->trailer->load('movie')->get();

        foreach($trailers as $trailer){
            $data[] = new TrailerResource($trailer);
        }

        return $data;
    }


    public function updateTrailer(Request $request){
        $checkTrailer = $this->trailer->find($request->id);
        if($checkTrailer){
            $data = [
                'key' => $request->key,
            ];
            $checkTrailer->update($data);
            return response()->json([
                'status' => 200,
                'message' => 'Updated successfully',
            ]);
        }

        return response()->json([
            'status' => 401,
            'message' => 'Id trailer not found',
        ]);
    }

    public function deleteTrailer(Request $request){
        $isSoftDelete = $this->trailer->onlyTrashed()->find($request->id);
        if($isSoftDelete){
            if($request->type === 'delete'){
                $isSoftDelete->forceDelete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Clear trailer successfully',
                ]);
            }else{
                $isSoftDelete->restore();
                return response()->json([
                    'status' => 200,
                    'message' => 'Restore data successfully',
                ]);
            }

        }else{
            $checkid= $this->trailer->find($request->id);
            if(!$checkid){
                return response()->json([
                    'status' => 401,
                    'message' => 'Id trailer not found',
                ]);
            }

            $checkid->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Id trailer was deleted successfully',
            ]);
        }
    }

    public function getTrashed(){
        $trailers = $this->trailer->onlyTrashed()->get();
        $data = [];
        if($trailers){
            foreach($trailers as $trailer){
                $data[] = new TrailerResource($trailer);
            }
        }

        return $data;
    }
}
