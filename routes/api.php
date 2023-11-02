<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MovieController;
use App\Http\Controllers\Api\CastController;
use App\Http\Controllers\Api\Trailers;
use App\Http\Controllers\Api\GenreController;


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


Route::get('/movie/detail/{id}', [MovieController::class, 'movieDetail'])->name('get-movie_id-detail');
Route::get('/cast/detail/{id}',[CastController::class, 'detail'])->name('get-cast_id-detail');
Route::get('/movie/getAll', [MovieController::class, 'getAll'])->name('getall-movie');
Route::get('/cast/getAll', [CastController::class, 'getAll'])->name('getall-cast');
Route::get('/trailer/getTrailer/{id}', [Trailers::class, 'getTrailer'])->name('get-trailer_id-detail');
Route::get('/genre/getAll', [GenreController::class, 'getAll'])->name('getall-genre');




Route::middleware(['auth:sanctum', 'isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });

    //Controller Movie ===========================================================
    Route::post('/movie/createMovie', [MovieController::class, 'createMovie'])->name('create-movie');


    //Controller Cast ============================================================
    Route::post('/cast/createCast', [CastController::class, 'createCast'])->name('create-cast');
    
    //Controller Trailer =========================================================
    Route::post('trailer/createTrailer', [Trailers::class, 'createTrailer'])->name('create-trailer');

    //Controller Genre ============================================================
    Route::post('genre/createGenre', [GenreController::class, 'createGenre'])->name('create-genre');

});




//check user logout
Route::middleware(['auth:sanctum'])->group(function () {
    
    Route::post('logout', [AuthController::class, 'logout']);
});



// Authorization user with role or permissions
Route::middleware(['auth:sanctum','role_or_permission:users.list'])->group(function() {
    Route::get('user', [AuthController::class, 'user']);
});






