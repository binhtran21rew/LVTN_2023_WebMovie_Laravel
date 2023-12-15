<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\FoodRequest;
use App\Http\Resources\Foodresource;
use App\Models\ComboFood;
use App\Models\Food;
use App\Traits\StoreImg;
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
        $food = $this->food->with('combo')->get();

        foreach($food as $data){
            $result[] = new Foodresource($data);
        }
        return $result;
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
            ];
            $loadFood = $this->food->create($dataFood);
            if($request->combo){
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
            }
    

            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Create food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage();
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
            return $e->getMessage();
        }  
    }

    public function updateFood (FoodRequest $request){
        $checkName = $this->food->where('name', $request->name)->first();
        $checkIdFood = $this->food->find($request->id);
        $checkIdCombo = $this->comboFood->find($request->idCombo);
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
                if($request->combo){
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
        
            }

           

            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Update food successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return $e->getMessage();
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

    public function getAllComboFood(){
        $food = $this->comboFood->all();

        foreach($food as $data){
            $result[] = new Foodresource($data);
        }
        return $result;
    }




}
