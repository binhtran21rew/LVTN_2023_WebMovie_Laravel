<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MovieRequest;
use App\Http\Resources\MovieResource;
use App\Models\Cast;
use App\Models\Movie;
use App\Models\Movie_cast;
use App\Models\Movie_detail;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MovieController extends Controller
{
    public function create(MovieRequest $request){
        try{
            DB::beginTransaction();
            $movie = Movie::create([
                'title' => $request->title,
                'post_path' => $request->post_path,
                'backdrop_path' => $request->backdrop_path,
                'release' => $request->release,
            ]);

            Movie_detail::create([
                'movie_id' => $movie['id'],
                'title' => $movie['title'],
                'overview' =>  $request->overview ?? '',
                'vote_count' => 0,
                'vote_average' => 0,
                'status'  => $request->status
            ]);
            DB::commit();
            $this->addCast($movie['id'], $request->cast_id);
            return new MovieResource($movie);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage();
        }

    }

    public function addCast($idmovie, $idcast){
        $checkCast = Cast::where('id', $idcast);
        if($checkCast) {
            Movie_cast::create([
                'movie_id' => $idmovie,
                'cast_id' =>  $idcast
            ]);
        }else{
            response()->json([
                'status' => 401,
                'message' => 'Cast not found',
            ]);
        }
        
    }


    public function info($id){
        $movie = Movie::find($id); 
        if($movie){
            return new MovieResource($movie);
        }
        return  response()->json([
            'status' => 404,
            'message' => 'Not found movie'
        ]);
    }

    public function getAll(){
        $movies = Movie::all();
        
        foreach($movies as $movie){
            $data[] = new MovieResource($movie);
        }

        return $data;
    }

}
