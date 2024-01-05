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
use App\Models\Schedule;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Traits\StoreImg;
use Carbon\Carbon;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;
use Ramsey\Uuid\Type\Integer;

class MovieController extends Controller
{
    use StoreImg;
    private $movie;
    private $cast;
    private $movie_detail;
    private $genre;
    private $schedule;
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
            if($uploadPoster === null){
                return response()->json([
                    'status' => 401,
                    'message' => 'File image poster cannot be null',
                ]);
            }
            $uploadBackdrop = $this->imgUpload($request, 'backdrop_path', 'movie');
            if($uploadBackdrop === null){
                return response()->json([
                    'status' => 401,
                    'message' => 'File image poster cannot be null',
                ]);
            }
            $movie = $this->movie->create([
                'title' => $request->title,
                'post_path' => $uploadPoster,
                'backdrop_path' => $uploadBackdrop,
                'release' => $request->release,
                'time' => $formatted_time,
                'price' => $request->price
            ]);
            $movieDetail = $this->movie_detail->create([
                'movie_id' => $movie['id'],
                'title' => $movie['title'],
                'overview' =>  $request->overview ?? '',
                'imdb' => $request->imdb,
                'status'  => $request->status
            ]);
            if($request->casts){
                foreach($request->casts as $value){
                    if(!$value){
                        return response()->json([
                            'status' => 401,
                            'message' => 'List cast not found',
                        ]);
                    }
                    $cast = $this->cast->find($value);
                    $castID[] = $cast->id;
                }
                $movie->movie_cast()->attach($castID);
            }
            if($request->genres){
                foreach( $request->genres as $value){
                    if(!$value){
                        return response()->json([
                            'status' => 401,
                            'message' => 'List genres not found',
                        ]);
                    }
                    $genre = $this->genre->find($value);
                    $genreID[] = $genre->id;

                }
                $movieDetail->movie_genre()->attach($genreID);
            }

            Cache::delete('allMovieAdmin');
            Cache::remember('allMovieAdmin', 60*60*24, function(){
                return $this->movie_detail->load(['movie.movie_cast', 'movie_genre'])->get()->map(function($d){
                    return new MovieDetailResource($d);
                });
            });
    
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Created successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Created movie failed',
            ]);
        }
    }


    public function getMovieId($id){
        $cache = Cache::get('movie_'.$id);
        
        if($cache !== null){
            return $cache;
        }
        $movie = $this->movie->find($id);

        if($movie->count() > 0){
            Cache::remember('movie_'.$id, 60*60*24,function() use($movie){
                return  $movie;
            });
            return $cache;
        }
        return  response()->json([
            'status' => 404,
            'message' => 'Not found movie'
        ]);
    }
    public function movieDetail($id){
        $cache = Cache::get('movie_detail_'.$id);

        if($cache !== null){
            return $cache;
        }
        $detail = $this->movie_detail->load(['movie', 'movie_genre'])->where('id', $id)->first();
        if($detail){
            Cache::remember('movie_detail_'.$id, 60*60*24, function() use ($detail){
                return new MovieDetailResource($detail);
            });
            return $cache;
        }
        return  response()->json([
            'status' => 404,
            'message' => 'Not found movie'
        ]);
    }
    public function getAdminMovie(){

        $cache = Cache::get('allMovieAdmin');

        if($cache !== null){
            return $cache;
        }
        
        Cache::remember('allMovieAdmin', 60*60*24, function(){
            return $this->movie_detail->load(['movie.movie_cast', 'movie_genre'])->get()->map(function($d){
                return new MovieDetailResource($d);
            });
        });

        return $cache;
        // Cache::delete('allMovieAdmin');
    }
    public function getAll(){
        $cache = Cache::get('allMovieShow');

        if($cache !== null){
            return $cache;
        }
        Cache::remember('allMovieShow', 60*60*24, function(){
            return $this->movie->withWhereHas('movie_detail', fn($query) => 
                $query->where('status', 1)
            )->get()->map(function($movie){
                return new MovieResource($movie);
            });
        });
        return $cache;


    }
    public function getPage($page){
        $limitPerPage = 6;
        $newPage = (($page - 1) * $limitPerPage);

        $movies = $this->movie->offset($newPage)->limit($limitPerPage)->get();


        if($movies->count() > 0){
            foreach($movies as $movie){
                $data[] = new MovieResource($movie);
            }
    
            return $data;

        }

        return $movies;
    }



    public function getMovieContent($type){
        // $cache = Cache::get('movie_content_'.$type);

        // if($cache !== null){
        //     return $cache;
        // }

        // Cache::remember('movie_content_'.$type, 60*60*24, function() use ($type){
        //     return $this->movie->withWhereHas('movie_detail', fn($query) =>
        //         $query->where('status', $type)
        //     )->limit(8)->get()->map(function($movie){
        //         return new MovieResource($movie);
        //     });
        // });
        

        // return $cache;
        return $this->movie->withWhereHas('movie_detail', fn($query) =>
            $query->where('status', $type)
        )->limit(8)->get()->map(function($movie){
            return new MovieResource($movie);
        });
        // Cache::delete('movie_content_'.$type);

    }


    public function updateMovie(Request $request){
        try{
            DB::beginTransaction();
            $minutes = $request->time;
            $formatted_time = floor($minutes / 60) . ':'. ($minutes -   floor($minutes / 60) * 60).':00';

            $checkMovie = $this->movie->find($request->movie_id);
            if($checkMovie){
                $checkDetail = $this->movie_detail->where('movie_id', $request->movie_id)->first();
                $uploadPoster = $this->imgUpload($request, 'post_path', 'movie');
                $uploadBackdrop = $this->imgUpload($request, 'backdrop_path', 'movie');

                $dataMovie = [
                    'title' => $request->title,
                    'release' => $request->release,
                    'time' => $formatted_time,
                ];
                $dataDetail = [
                    'title' => $request->title,
                    'overview' => $request->overview,
                    'status' => $request->status,
                ];
                if(!empty($uploadPoster)){
                    File::delete(public_path($checkMovie->post_path));
                    $dataMovie['post_path'] = $uploadPoster;
                }
                if(!empty($uploadBackdrop)){
                    File::delete(public_path($checkMovie->backdrop_path));
                    $dataMovie['backdrop_path'] = $uploadBackdrop;
                }
                if($request->casts){
                    foreach($request->casts as $value){
                        $cast = $this->cast->find($value);
                        $castID[] = $cast->id;
                    }
                    $checkMovie->movie_cast()->sync($castID);
                }
                if($request->genres){
                    foreach( $request->genres as $value){
                        $genre = $this->genre->find($value);
                        $genreID[] = $genre->id;
                    }
                    $checkDetail->movie_genre()->sync($genreID);
                }
                $checkMovie->update($dataMovie);
                $checkDetail->update($dataDetail);
                Cache::delete('allMovieAdmin');

                DB::commit();
                return  response()->json([
                    'status' => 200,
                    'message' => 'Update successfully'
                ]);
            }
        }catch(Exception $e){
            DB::rollBack();
            return  response()->json([
                'status' => 401,
                'message' => 'Update movie failed'
            ]);
        }
    }

    public function deleteMovie(Request $request){

        $today = Carbon::now()->toDateString();

        $isSoftDeleteMovie = $this->movie->onlyTrashed()->find($request->id);
        $isSoftDeleteDetail = $this->movie_detail->onlyTrashed()->find($request->id_detail);
        
        if($isSoftDeleteMovie){
            if($request->type === 'delete'){
                try{
                    DB::beginTransaction();
                    
                    File::delete(public_path($isSoftDeleteMovie->backdrop_path));
                    File::delete(public_path($isSoftDeleteMovie->post_path));

                    if($isSoftDeleteMovie->movie_cast->count() !== 0){
                        foreach($isSoftDeleteMovie->movie_cast as $data){
                            $listCast[] = $data->id;
                        }
                        $isSoftDeleteMovie->movie_cast()->detach($listCast);
                    }
                    if($isSoftDeleteDetail->movie_genre->count() !== 0){
                        foreach($isSoftDeleteDetail->movie_genre as $data){
                            $listGenre[] = $data->id;
                        }
                        $isSoftDeleteDetail->movie_genre()->detach($listGenre);
                    }
                    $isSoftDeleteDetail->forceDelete();
                    $isSoftDeleteMovie->forceDelete();

                    DB::commit();
                    return response()->json([
                        'status' => 200,
                        'message' => 'Delete data successfully',
                    ]);
                }catch(Exception $e){
                    DB::rollBack();
                    return response()->json([
                        'status' => 401,
                        'message' => 'Some thing wrong !',
                    ]); 
                }
            }else{
                try{
                    DB::beginTransaction();
                        $isSoftDeleteMovie->restore();
                        $isSoftDeleteDetail->restore();

                        Cache::delete('allMovieAdmin');
                        Cache::remember('allMovieAdmin', 60*60*24, function(){
                            return $this->movie_detail->load(['movie.movie_cast', 'movie_genre'])->get()->map(function($d){
                                return new MovieDetailResource($d);
                            });
                        });
                    DB::commit();
                    return response()->json([
                        'status' => 200,
                        'message' => 'Restore data successfully',
                    ]);
                }catch(Exception $e){
                    DB::rollBack();
                    return response()->json([
                        'status' => 401,
                        'message' => 'Some thing wrong !',
                    ]); 
                }

            }
        }else{
            $checkUsagesTrailer = $this->movie->with('movie_trailer')->find($request->id);
            $checkUsagesSchedule = $this->movie->with(['schedule' => function(Builder $query ) use($today){
                $query->where('date', '>=', $today);
            }])->find($request->id);
    
            if($checkUsagesTrailer->movie_trailer !== null){
                return response()->json([
                    'status' => 401,
                    'message' => 'The movie is in trailer. Can not delete !',
                ]);
            }
            if($checkUsagesSchedule->schedule->count() !== 0){
                return response()->json([
                    'status' => 401,
                    'message' => 'The movie is set schedule. Can not delete !',
                ]);
            }
    
            try{
                DB::beginTransaction();
                $getDetailGenres = $this->movie_detail->find($request->id_detail);
                $getCast = $this->movie->find($request->id);
                
                $getCast->delete();
                $getDetailGenres->delete();
    
                Cache::delete('allMovieAdmin');
                Cache::remember('allMovieAdmin', 60*60*24, function(){
                    return $this->movie_detail->load(['movie.movie_cast', 'movie_genre'])->get()->map(function($d){
                        return new MovieDetailResource($d);
                    });
                });
                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => 'Id movie was deleted successfully !',
                ]);
            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => 'Some thing wrong !',
                ]);
            }
        }
        
    }


    public function getTrashed(){
        $movies = $this->movie_detail->onlyTrashed()->get();
    
        return $movies;
    }

    public function searchMovie(Request $request){
        if($request->type === 'movie'){
            $data = $this->movie->where('title', 'like' ,'%'.$request->input('query').'%')->get();
            return $data;
        }
    }

    public function searchMovieAdmin(Request $request){

        if($request->filter === 'title'){
            $result =  $this->movie_detail
            ->load(['movie.movie_cast', 'movie_genre'])
            ->where('title', 'like' ,'%'.$request->keyword.'%')
            ->get()->map(function($d){
                return new MovieDetailResource($d);
            });
        }else if($request->filter === 'setup'){
            $schedules = Schedule::all();
            foreach($schedules as $data){
                $ids[] = $data->movie_id;
            }

            $result =  $this->movie_detail
                ->load(['movie.movie_cast', 'movie_genre'])
                ->where('title', 'like' ,'%'.$request->keyword.'%')
                ->whereIn('movie_id', $ids)->get()->map(function($d){
                    return new MovieDetailResource($d);
                });
        }else if($request->filter === 'unsetup'){
            $schedules = Schedule::all();
            foreach($schedules as $data){
                $ids[] = $data->movie_id;
            }

            $result =  $this->movie_detail
                ->load(['movie.movie_cast', 'movie_genre'])
                ->where('title', 'like' ,'%'.$request->keyword.'%')
                ->whereNotIn('movie_id', $ids)->get()->map(function($d){
                    return new MovieDetailResource($d);
                });
        }else{
            $result =  $this->movie_detail
            ->load(['movie.movie_cast', 'movie_genre'])
            ->where('status', $request->filter)
            ->where('title', 'like' ,'%'.$request->keyword.'%')
            ->get()->map(function($d){
                return new MovieDetailResource($d);
            });
        }
       
        return  $result;
    }

}
