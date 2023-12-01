<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MovieController;
use App\Http\Controllers\Api\CastController;
use App\Http\Controllers\Api\Trailers;
use App\Http\Controllers\Api\GenreController;
use App\Http\Controllers\Api\RoomController;
use App\Http\Controllers\Api\ScheduleController;


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

Route::get('/Movie/page/{page}', [MovieController::class, 'getPage'])->name('getall-movie');
Route::get('/Movie/detail/{id}', [MovieController::class, 'movieDetail'])->name('get-movie_id-detail');
Route::get('/Movie/getAll', [MovieController::class, 'getAll'])->name('getall-movie');
Route::get('/Movie/getType/{type}', [MovieController::class, 'getTypeMovie'])->name('get-type-movie');
Route::get('/Movie/getContent/{type}', [MovieController::class, 'getMovieContent'])->name('get-type-movie');


Route::get('/Cast/detail/{id}',[CastController::class, 'detail'])->name('get-cast_id-detail');
Route::get('/Cast/getAll', [CastController::class, 'getAll'])->name('getall-cast');

Route::get('/Trailer/getTrailer/{id}', [Trailers::class, 'getTrailer'])->name('get-trailer_id-detail');
Route::get('/Trailer/getAll', [Trailers::class, 'getAllTrailer'])->name('create-trailer');

Route::get('/Genre/getAll', [GenreController::class, 'getAll'])->name('getall-genre');

Route::get('/Room/getAll', [RoomController::class, 'getAll'])->name('getall-room');
Route::get('/Room/getAvailable', [RoomController::class, 'getAvailable'])->name('getall-room');


Route::get('Schedule/getBookingSchedule/{movie}', [ScheduleController::class, 'getBookingSchedule'])->name('getSchedule');
Route::get('Schedule/getTicket/{schedule}', [ScheduleController::class, 'getTicket'])->name('getTicket');

Route::middleware(['auth:sanctum', 'isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });

    //Controller Movie ===========================================================
    Route::post('/Movie/createMovie', [MovieController::class, 'createMovie'])->name('create-movie');
    Route::get('/Movie/getMovie', [MovieController::class, 'getAdminMovie'])->name('getAdmin-movie');
    Route::post('/Movie/updateMovie', [MovieController::class, 'updateMovie'])->name('update-movie');

    //Controller Cast ============================================================
    Route::post('/Cast/createCast', [CastController::class, 'createCast'])->name('create-cast');
    Route::post('/Cast/updateCast', [CastController::class, 'updateCast'])->name('update-cast');
    

    //Controller Trailer =========================================================
    Route::post('Trailer/createTrailer', [Trailers::class, 'createTrailer'])->name('create-trailer');
    Route::post('Trailer/updateTrailer', [Trailers::class, 'updateTrailer'])->name('update-trailer');
    //Controller Genre ============================================================
    Route::post('Genre/createGenre', [GenreController::class, 'createGenre'])->name('create-genre');
    Route::post('Genre/updateGenre', [GenreController::class, 'updateGenre'])->name('update-genre');
    //Controller Room =============================================================
    Route::post('Room/createRoom', [RoomController::class, 'createRoom'])->name('create-room');
    Route::post('Room/updateRoom', [RoomController::class, 'updateRoom'])->name('update-room');

    //Controller Schedule ==========================================================
    Route::post('Schedule/createSchedule', [ScheduleController::class, 'createSchedule'])->name('create-schedule');
    Route::get('Schedule/getSchedule', [ScheduleController::class, 'getAllSchedule'])->name('getAll-schedule');
    Route::get('Schedule/getSchedule/{room}', [ScheduleController::class, 'getSchedule'])->name('getSchedule');
    Route::post('Schedule/updateSchedule', [ScheduleController::class, 'updateSchedule'])->name('updateSchedule');
});





Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    
});



// Authorization user with role or permissions
Route::middleware(['auth:sanctum','role_or_permission:users.list'])->group(function() {
    Route::get('user', [AuthController::class, 'user']);
});






