<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\GenreRequest;
use App\Models\Genre;
use Illuminate\Http\Request;

class GenreController extends Controller
{
    private $genre;
    public function __construct(Genre $genre){
        $this->genre = $genre;
    }

    public function createGenre(GenreRequest $request){
        $checkName = $this->genre->where('name', $request->name)->first();
        if($checkName){
            return response()->json([
                'status' => 401,
                'message' => 'Trailer has already been',
            ]);
        }
        $dataGenre = [
            "name" => $request->name,
        ];
        $this->genre->create($dataGenre);

        return response()->json([
            'status' => 200,
            'message' => 'Created genre successfully',
        ]);

    }

    public function getAll(){
        return $this->genre->all();
    }

    public function updateGenre(Request $request){
        $checkGenre = $this->genre->find($request->id);
        if($checkGenre){
            $data = [
                'name' => $request->name,
            ];
            $checkGenre->update($data);
            return response()->json([
                'status' => 200,
                'message' => 'Update Success'
            ]);
        }

        return response()->json([
            'status' => 401,
            'message' => 'Id genre not found'
        ]);
    }


    public function deleteGenre(Request $request){
        $isSoftDelete = $this->genre->onlyTrashed()->find($request->id);
        $checkUsages = $this->genre->with('movie_detail')->find($request->id);

        if($isSoftDelete){
            if($request->type === 'delete'){
                $isSoftDelete->forceDelete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Clear genre successfully',
                ]);
            }else{
                $isSoftDelete->restore();
                return response()->json([
                    'status' => 200,
                    'message' => 'Restore data successfully',
                ]);
            }

        }else{
            if($checkUsages->movie_detail->count() === 0){
                $checkid= $this->genre->find($request->id);
                if(!$checkid){
                    return response()->json([
                        'status' => 401,
                        'message' => 'Id genre not found',
                    ]);
                }
    
                $checkid->delete();
                return response()->json([
                    'status' => 200,
                    'message' => 'Id genre was deleted successfully',
                ]);
            }
            return response()->json([
                'status' => 401,
                'message' => 'The genre is in movie. Can not delete !',
            ]);
        }
    }

    public function getTrashed(){
        $genres = $this->genre->onlyTrashed()->get();
    
        return $genres;
    }

}
