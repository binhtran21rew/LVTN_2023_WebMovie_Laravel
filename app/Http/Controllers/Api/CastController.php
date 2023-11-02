<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CastRequest;
use App\Http\Resources\CastResource;
use App\Http\Resources\MovieResource;
use App\Models\Cast;
use App\Models\Movie;
use App\Models\Movie_cast;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\StoreImg;

class CastController extends Controller
{
    use StoreImg;
    private $cast;
    private $movie_cast;
    private $movie;
    public function __construct(Cast $cast, Movie_cast $movie_cast, Movie $movie){
        $this->cast = $cast;
        $this->movie = $movie;
        $this->movie_cast = $movie_cast;
    }
    public function createCast(CastRequest $request){
        try{
            DB::beginTransaction();
            $uploadImage = $this->imgUpload($request, 'profile_path', 'cast');
            $cast = $this->cast->create([
                'name' => $request->name,
                'profile_path' => $uploadImage
            ]);
            DB::commit();

            return new CastResource($cast);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage(); 
        }
    }

    public function getAll(){
        return $this->cast->all();
    }

    public function detail($id){
        $checkMovie =  $this->movie->find($id);
        if($checkMovie){
            return new CastResource($checkMovie);
        }
    }
}
