<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\FoodRequest;
use App\Http\Resources\Foodresource;
use App\Models\ComboFood;
use App\Models\Food;
use App\Traits\StoreImg;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Support\Facades\DB;

class FoodController extends Controller
{
    use StoreImg;
    private $food;
    private $comboFood;

    public function __construct(Food $food, ComboFood $comboFood){
        $this->food = $food;
        $this->comboFood = $comboFood;
    }
    public function getAllFood(){
        $food =  $this->food->get();;

        return $food;

    }
    public function getAllComboFood(){
        $food = $this->comboFood->all();

        if($food->count() > 0){
            foreach($food as $data){
                $result[] = new Foodresource($data);
            }
            return $result;
        }
        return $food;

    }

    public function getAvailableFood(){
        $food = $this->comboFood->where('count', '>', 0)->get();


        if($food->count() > 0){
            foreach($food as $data){
                $result[] = new Foodresource($data);
            }
            return $result;
        }

        return $food;
    }

    public function createFood(FoodRequest $request){
        $checkName = $this->food->where('name', $request->name)->first();

        if($checkName){
            return response()->json([
                'status' => 401,
                'message' => 'There have food available',
            ]);
        }
        try{
            DB::beginTransaction();
            $dataFood = [
                'name' => $request->name,
                'type' => $request->combo
            ];
            $loadFood = $this->food->create($dataFood);
            
            if($request->combo === 'drink'){
                $dataComboFood = [
                    'name' => $request->name,
                    'price' => $request->price,
                    'detail' => $request->name,
                    'count' => $request->count,
                    'image_path' => '/assets/image/drink.jpg'
                ];
            }
            if($request->combo === 'food'){
                $dataComboFood = [
                    'name' => $request->name,
                    'price' => $request->price,
                    'detail' => $request->name,
                    'count' => $request->count,
                    'image_path' => '/assets/image/popcorn.jpg'
                ];
            }
            $loadComboFood = $this->comboFood->create($dataComboFood);

            $loadComboFood->food()->attach($loadFood);
            
    

            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Create food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Some thing wrong',
            ]);
        }  
    }


    public function createComboFood(FoodRequest $request){
        $checkNameCombo = $this->comboFood->where('name', $request->name)->first();
        try{
            DB::beginTransaction();
            foreach( $request->foodCount as $key => $value){
                if($value !== "0"){
                    $food = $this->food->find($key);
                    $foodID[] = $value. ' '.$food->name;
                }
            }
            $arrayFood =  implode(', ', $foodID);
        
            $uploadImage = $this->imgUpload($request, 'image', 'food');
        
            if($checkNameCombo){
                return response()->json([
                    'status' => 401,
                    'message' => 'There have food available',
                ]);
            }
            $dataCombo = [
                'name' => $request->name,
                'price' => $request->price,
                'detail' => $arrayFood,
                'count' => $request->count,
                'image_path' => $uploadImage ? $uploadImage : '/assets/image/combo.jpg'
            ];
        
        
            $this->comboFood->create($dataCombo);
            
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Create food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Some thing wrong',
            ]);
        }  
    }

    public function updateFood (FoodRequest $request){
        $checkName = $this->food->where('name', $request->name)->first();
        $checkIdFood = $this->food->find($request->id);
        $checkIdCombo = $this->comboFood->with('food')->find($request->idCombo);
        $findCombo = $this->comboFood->with('food')->where('detail', 'like', '%'.$request->oldname.'%')->where('id', '<>', $request->idCombo)->get();
        if($checkName && $checkName->id !== $checkIdFood->id){
            return response()->json([
                'status' => 401,
                'message' => 'There have food available',
            ]);
        }
        

        try{
            DB::beginTransaction();

            if($checkIdFood){
                $dataFood = [
                    'name' => $request->name,
                ];

                $checkIdFood->update($dataFood);
                
                if($request->combo === 'drink'){
                    $dataComboFood = [
                        'name' => $request->name,
                        'price' => $request->price,
                        'detail' => $request->name,
                        'count' => $request->count,
                        'image_path' => '/assets/image/drink.jpg'
                    ];
                }
                if($request->combo === 'food'){
                    $dataComboFood = [
                        'name' => $request->name,
                        'price' => $request->price,
                        'detail' => $request->name,
                        'count' => $request->count,
                        'image_path' => '/assets/image/popcorn.jpg'
                    ];
                }
                $checkIdCombo->update($dataComboFood);
                
        
            }

            if($findCombo->count() > 0){
                foreach($findCombo as $data){
                    $a = str_replace($request->oldname, $request->name, $data->detail);
                    $data->update([
                        'detail' => $a
                    ]);
                }
            }

        
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Update food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => 'Some thing wrong',
            ]);
        }  
    }
    public function updateComboFood(FoodRequest $request){
        $checkNameCombo = $this->comboFood->where('name', $request->name)->first();
        $checkIdFood = $this->comboFood->find($request->idCombo);
        if($checkNameCombo && $checkNameCombo->id !== $checkIdFood->id){
            return response()->json([
                'status' => 401,
                'message' => 'There have food available',
            ]);
        }
        try{
            DB::beginTransaction();
            $uploadImage = $this->imgUpload($request, 'image', 'food');

            if(isset($request->detailFood)){
                foreach( $request->foodCount as $key => $value){
                    if($value !== "0"){
                        $food = $this->food->find($key);
                        $foodID[] = $value. ' '.$food->name;
                    }
                }
                $arrayFood =  implode(', ', $foodID);
                $dataCombo = [
                    'name' => $request->name,
                    'price' => $request->price,
                    'detail' => $arrayFood,
                    'count' => $request->count,
                    'image_path' => $uploadImage ? $uploadImage : '/assets/image/combo.jpg'
                ];
            }else{
                $dataCombo = [
                    'name' => $request->name,
                    'price' => $request->price,
                    'detail' => $request->detail_default,
                    'count' => $request->count,
                    'image_path' => $uploadImage ? $uploadImage : '/assets/image/combo.jpg'
                ];
            }
            
            $checkIdFood->update($dataCombo);
            
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Update food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            // return $e->getMessage();
            return response()->json([
                'status' => 401,
                'message' => 'Validation failed',
            ]);
        }  
    }

    public function deleteFood(Request $request){
        $isFood = $request->idCombo === 'undefined';
        
        if($isFood){
            $foodId= $request->idFood;
            $checkFood = $this->food->find($foodId);
            $findCombo = $this->comboFood->with('food')->where('detail', 'like', '%'.$checkFood->name.'%')->get();


            if($findCombo->count() > 1){
                return response()->json([
                    'status' => 401,
                    'message' => 'This food is used for another combo. Can not delete it !',
                ]);
            }
            try{
                DB::beginTransaction();
                $findCombo[0]->food()->detach($foodId);
                $checkFood->forceDelete();
                $findCombo[0]->forceDelete();
                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => 'Deleted food successfully',
                ]);
            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => 'Some thing wrong',
                ]);
            }
            
            
        }else{
            $isFood= $request->idFood !== 'undefined';
            
            if($isFood){
                $checkFood = $this->food->find($request->idFood);
                $findCombo = $this->comboFood->with('food')->where('detail', 'like', '%'.$checkFood->name.'%')->get();
                if($findCombo->count() > 1){
                    return response()->json([
                        'status' => 401,
                        'message' => 'This food is used for another combo. Can not delete it !',
                    ]);
                }
                try{
                    DB::beginTransaction();
                    
                    $findCombo[0]->food()->detach($checkFood);
                    $checkFood->forceDelete();
                    $findCombo[0]->forceDelete();
                    DB::commit();
                    return response()->json([
                        'status' => 200,
                        'message' => 'Deleted food successfully',
                    ]);
                }catch(Exception $e){
                    DB::rollBack();
                    return response()->json([
                        'status' => 401,
                        'message' => 'Some thing wrong',
                    ]);
                }
            }
        }
    }


    public function getTrashed(Request $request){
        if($request->type === 'food'){
            $foods = $this->food->onlyTrashed()->get();
            return $foods;
        }else{
            $combo = $this->comboFood->onlyTrashed()->get();
            return  $combo;

        }        
    }


    public function searchFood(Request $request){
        if($request->filter === 'name'){
            $result =  $this->comboFood
            ->where('name', 'like' ,'%'.$request->keyword.'%')
            ->get()->map(function($d){
                return new Foodresource($d);
            });
        }else if($request->filter === 'combo'){
            $result =  $this->comboFood
            ->where('detail', 'like' ,'%'.$request->keyword.'%')
            ->get()->map(function($d){
                return new Foodresource($d);
            });
        }


        return $result;
    }



}
