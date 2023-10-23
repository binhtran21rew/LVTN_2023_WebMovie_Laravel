<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MovieController;
use App\Http\Controllers\Api\CastController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::get('/user', [AuthController::class, 'user']);
Route::post('/login', [AuthController::class, 'loginUser']);
Route::post('/register', [AuthController::class, 'registerUser']);

Route::prefix('web')->group(function () {
    Route::get('/movies/getall', [MovieController::class, 'getAll']);
});

Route::middleware(['auth:sanctum', 'isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });

    //Controller Movie =========================================
    Route::post('/movie/create', [MovieController::class, 'create'])->name('create-movie');
    Route::get('/movie/info/{id}', [MovieController::class, 'info'])->name('info-movie');
    // =========================================================

    //Controller Cast ==========================================
    Route::post('/cast/create', [CastController::class, 'create'])->name('create-cast');

    // =========================================================


});




//check user logout
Route::middleware(['auth:sanctum'])->group(function () {
    
    Route::post('logout', [AuthController::class, 'logout']);
});



// Authorization user with role or permissions
Route::middleware(['auth:sanctum','role_or_permission:users.list'])->group(function() {
    Route::get('user', [AuthController::class, 'user']);
});






