<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Food;
use Illuminate\Http\Request;

class FoodController extends Controller
{
    private $food;

    public function __construct(Food $food){
        $this->food = $food;
    }

    public function createFood(){
        
    }
}
