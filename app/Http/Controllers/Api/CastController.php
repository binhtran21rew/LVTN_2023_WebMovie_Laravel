<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CastRequest;
use App\Http\Resources\CastResource;
use App\Models\Cast;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CastController extends Controller
{
    public function create(CastRequest $request){
        try{
            DB::beginTransaction();
            $cast = Cast::create([
                'name' => $request->name,
                'profile_path' => $request->profile_path
            ]);
            DB::commit();

            return new CastResource($cast);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage(); 
        }
    }
}
