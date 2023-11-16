<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\TrailerRequest;
use App\Http\Resources\TrailerResource;
use App\Models\Movie;
use App\Models\Trailer;
use Exception;
use Illuminate\Http\Request;

class Trailers extends Controller
{
    private $movie;
    private $trailer;
    public function __construct(Movie $movie, Trailer $trailer){
        $this->movie = $movie;
        $this->trailer = $trailer;

    }

    public function createTrailer(TrailerRequest $request){
        $checkMovie = $this->movie->find($request->movie_id);
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
                "movie_id" => $request->movie_id,
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
}
