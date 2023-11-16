<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\MovieRequest;
use App\Http\Resources\MovieDetailResource;
use App\Http\Resources\MovieResource;
use App\Models\Cast;
use App\Models\Genre;
use App\Models\Movie;
use App\Models\Movie_cast;
use App\Models\Movie_detail;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\StoreImg;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Ramsey\Uuid\Type\Integer;

class MovieController extends Controller
{
    use StoreImg;
    private $movie;
    private $cast;
    private $movie_detail;
    private $genre;
    public function __construct(Movie $movie, Cast $cast, Movie_detail $movie_detail, Genre $genre){
        $this->movie = $movie;
        $this->cast = $cast;
        $this->movie_detail = $movie_detail;
        $this->genre = $genre;
    }
    public function createMovie(MovieRequest $request){
        try{
            DB::beginTransaction();
            $minutes = $request->time;
            $formatted_time = floor($minutes / 60) . ':'. ($minutes -   floor($minutes / 60) * 60).':00';

            $uploadPoster = $this->imgUpload($request, 'post_path', 'movie');
            $uploadBackdrop = $this->imgUpload($request, 'backdrop_path', 'movie');
            $movie = $this->movie->create([
                'title' => $request->title,
                'post_path' => $uploadPoster,
                'backdrop_path' => $uploadBackdrop,
                'release' => $request->release,
                'time' => $formatted_time,
            ]);
            $movieDetail = $this->movie_detail->create([
                'movie_id' => $movie['id'],
                'title' => $movie['title'],
                'overview' =>  $request->overview ?? '',
                'vote_count' => 0,
                'vote_average' => 0,
                'status'  => $request->status
            ]);
            if($request->casts){
                foreach( $request->casts as $value){
                    $cast = $this->cast->find($value);
                    $castID[] = $cast->id;
                }
                $movie->movie_cast()->attach($castID);
            }
            if($request->genres){
                foreach( $request->genres as $value){
                    $genre = $this->genre->find($value);
                    $genreID[] = $genre->id;
                }
                $movieDetail->movie_genre()->attach($genreID);
            }
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Created successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage();
        }
    }


    public function movieDetail($id){
        $detail = $this->movie_detail->load(['movie', 'movie_genre'])->where('id', $id)->first();
        if($detail){
            return new MovieDetailResource($detail);
        }
        return  response()->json([
            'status' => 404,
            'message' => 'Not found movie'
        ]);
    }
    public function getAdminMovie(){
        // ray()->queries();
        $data = Cache::remember('allMovieAdmin', 30, function(){
            return $this->movie_detail->load(['movie', 'movie_genre'])->get()->map(function($d){
                return new MovieDetailResource($d);
            });
        });
        return $data;
    }
    public function getAll(){
        $data = Cache::remember('allMovieAdmin', 30, function(){
            return $this->movie->load('movie_detail')->get()->map(function($movie){
                return new MovieResource($movie);
           });
        });
        return $data;
    }
    public function getPage($page){
        $limitPerPage = 6;
        $newPage = (($page - 1) * $limitPerPage);

        $movies = $this->movie->offset($newPage)->limit($limitPerPage)->get();
        foreach($movies as $movie){
            $data[] = new MovieResource($movie);
        }

        return $data;
    }

    public function getTypeMovie($type){
        $movies = $this->movie_detail->where('status', $type)->get();

        $data = $movies->map(function($movie){
            return new MovieDetailResource($movie);
        });

        return $data;
    }

}
