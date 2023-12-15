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
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Support\Facades\File;

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

    public function updateCast(Request $request){
        $checkCast = $this->cast->find($request->id);
        if($checkCast){
            $uploadImage = $this->imgUpload($request, 'profile_path', 'cast');
            $data = [
                'name' => $request->name,
            ];
            if(!empty( $uploadImage)){
                File::delete(public_path($checkCast->profile_path));
                $data['profile_path'] = $uploadImage;
            }

            
            $checkCast->update($data);
            return response()->json([
                'status' => 200,
                'message' => 'Updated successfully',
            ]);
        }

        return response()->json([
            'status' => 401,
            'message' => 'Id cast not found',

        ]);
    }


    public function deleteCast(Request $request){
        $isSoftDelete = $this->cast->onlyTrashed()->find($request->id);
        $checkUsages = $this->cast->with('movie')->find($request->id);
        if($isSoftDelete){
            if($request->type === 'delete'){
                File::delete(public_path($isSoftDelete->profile_path));
                $isSoftDelete->forceDelete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Clear cast successfully',
                ]);
            }else{
                $isSoftDelete->restore();
                return response()->json([
                    'status' => 200,
                    'message' => 'Restore data successfully',
                ]);
            }

        }else{
            if($checkUsages->movie->count() === 0){
                $checkid= $this->cast->find($request->id);
                if(!$checkid){
                    return response()->json([
                        'status' => 401,
                        'message' => 'Id cast not found',
                    ]);
                }
    
                $checkid->delete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Id cast was deleted successfully',
                ]);
            }
            return response()->json([
                'status' => 401,
                'message' => 'The cast is in movie. Can not delete !',
            ]);
        }
        
    }

    public function getTrashed(){
        $casts = $this->cast->onlyTrashed()->get();
    
        return $casts;
    }
}
