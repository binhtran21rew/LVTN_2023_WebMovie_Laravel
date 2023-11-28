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

}
