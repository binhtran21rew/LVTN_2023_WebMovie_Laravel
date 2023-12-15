<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\MovieController;
use App\Http\Controllers\Api\CastController;
use App\Http\Controllers\Api\FoodController;
use App\Http\Controllers\Api\Trailers;
use App\Http\Controllers\Api\GenreController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\RolePermissionController;
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


// Route::get('/user', [AuthController::class, 'user']);
Route::post('/login', [AuthController::class, 'loginUser']);
Route::post('/register', [AuthController::class, 'registerUser']);

Route::prefix('web')->group(function () {
    Route::get('/movies/getall', [MovieController::class, 'getAll']);
});

Route::get('/Movie/page/{page}', [MovieController::class, 'getPage'])->name('website_getall-movie');
Route::get('/Movie/detail/{id}', [MovieController::class, 'movieDetail'])->name('website_get-movie_id-detail');
Route::get('/Movie/getAll', [MovieController::class, 'getAll'])->name('website_getall-movie');
Route::get('/Movie/getContent/{type}', [MovieController::class, 'getMovieContent'])->name('website_get-type-movie');
Route::get('/Movie/getMovie/{id}', [MovieController::class, 'getMovieId'])->name('website_get-movieId');


Route::get('/Cast/detail/{id}',[CastController::class, 'detail'])->name('website_get-cast_id-detail');
Route::get('/Cast/getAll', [CastController::class, 'getAll'])->name('website_getall-cast');

Route::get('/Trailer/getTrailer/{id}', [Trailers::class, 'getTrailer'])->name('website_get-trailer_id-detail');
Route::get('/Trailer/getAll', [Trailers::class, 'getAllTrailer'])->name('website_create-trailer');

Route::get('/Genre/getAll', [GenreController::class, 'getAll'])->name('website_getall-genre');

Route::get('/Room/getAll', [RoomController::class, 'getAll'])->name('website_getall-room');
Route::get('/Room/getAvailable', [RoomController::class, 'getAvailable'])->name('website_getall-room');


Route::get('Schedule/getBookingSchedule/{movie}', [ScheduleController::class, 'getBookingSchedule'])->name('website_getSchedule');
Route::get('Schedule/getTicket/{schedule}', [ScheduleController::class, 'getTicket'])->name('website_getTicket');

Route::post('Booking/BookingTicket', [BookingController::class, 'bookingTicket'])->name('website_bookingTicket');


Route::middleware(['auth:sanctum', 'isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });


    //Controller Authentication ===================================================
    Route::get('/Account/getAll', [AuthController::class, 'getAccount'])->name('admin_getAccount');
    Route::post('/Account/createAccount', [AuthController::class, 'createAccount'])->name('admin_createAccount');

    //Controller Movie ===========================================================
    Route::post('/Movie/createMovie', [MovieController::class, 'createMovie'])->name('admin_create-movie');
    Route::get('/Movie/getMovie', [MovieController::class, 'getAdminMovie'])->name('admin_getAdmin-movie');
    Route::post('/Movie/updateMovie', [MovieController::class, 'updateMovie'])->name('admin_update-movie');
    Route::delete('/Movie/deleteMovie', [MovieController::class, 'deleteMovie'])->name('admin_delete-movie');
    Route::get('/Movie/getTrashed/Movie', [MovieController::class, 'getTrashed'])->name('admin_delete-movie');
    
    //Controller Cast ============================================================
    Route::post('/Cast/createCast', [CastController::class, 'createCast'])->name('admin_create-cast');
    Route::post('/Cast/updateCast', [CastController::class, 'updateCast'])->name('admin_update-cast');
    Route::delete('/Cast/deleteCast', [CastController::class, 'deleteCast'])->name('admin_delete-cast');
    Route::get('/Cast/getTrashed/Cast', [CastController::class, 'getTrashed'])->name('admin_delete-cast');
    
    //Controller Trailer =========================================================
    Route::post('Trailer/createTrailer', [Trailers::class, 'createTrailer'])->name('admin_create-trailer');
    Route::post('Trailer/updateTrailer', [Trailers::class, 'updateTrailer'])->name('admin_update-trailer');
    Route::delete('Trailer/deleteTrailer', [Trailers::class, 'deleteTrailer'])->name('admin_delete-trailer');
    Route::get('Trailer/getTrashed/Trailer', [Trailers::class, 'getTrashed'])->name('admin_delete-trailer');
    
    //Controller Genre ============================================================
    Route::post('Genre/createGenre', [GenreController::class, 'createGenre'])->name('admin_create-genre');
    Route::post('Genre/updateGenre', [GenreController::class, 'updateGenre'])->name('admin_update-genre');
    Route::delete('/Genre/deleteGenre', [GenreController::class, 'deleteGenre'])->name('admin_delete-Genre');
    Route::get('/Genre/getTrashed/Genre', [GenreController::class, 'getTrashed'])->name('admin_delete-Genre');
    
    //Controller Room =============================================================
    Route::post('Room/createRoom', [RoomController::class, 'createRoom'])->name('admin_create-room');
    Route::post('Room/updateRoom', [RoomController::class, 'updateRoom'])->name('admin_update-room');
    Route::delete('/Room/deleteRoom', [RoomController::class, 'deleteRoom'])->name('admin_delete-Room');
    Route::get('/Room/getTrashed/Room', [RoomController::class, 'getTrashed'])->name('admin_delete-Room');


    //Controller Schedule ==========================================================
    Route::post('Schedule/createSchedule', [ScheduleController::class, 'createSchedule'])->name('admin_create-schedule');
    Route::get('Schedule/getSchedule', [ScheduleController::class, 'getAllSchedule'])->name('admin_getAll-schedule');
    Route::get('Schedule/getSchedule/{room}', [ScheduleController::class, 'getSchedule'])->name('admin_getSchedule');
    Route::post('Schedule/updateSchedule', [ScheduleController::class, 'updateSchedule'])->name('admin_updateSchedule');

    //Controller Food ================================================================
    Route::post('Food/createFood', [FoodController::class, 'createFood'])->name('admin_createFood');
    Route::post('ComboFood/createComboFood', [FoodController::class, 'createComboFood'])->name('admin_createFood');
    Route::get('Food/getAll', [FoodController::class, 'getAllFood']);
    Route::get('ComboFood/getAll', [FoodController::class, 'getAllComboFood'])->name('admin_getAdmin-food');
    Route::post('Food/updateFood', [FoodController::class, 'updateFood'])->name('admin_updateFood');
    Route::post('ComboFood/updateComboFood', [FoodController::class, 'updateComboFood'])->name('admin_updateFood');


    //Controller Booking ===============================================================
    Route::get('Booking/getAll', [BookingController::class, 'getAllBookingAdmin'])->name('admin_getAllBooking');



    //Controller RolePermission
    Route::get('RolePermission/getAll', [RolePermissionController::class, 'getAllPermission'])->name('admin_getAllRolePermissions');
});





Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'user']);

    Route::post('/Payment/momo', [PaymentController::class, 'momoPayment'])->name('website_payment-momo');
    
});



// Authorization user with role or permissions
Route::middleware(['auth:sanctum','role_or_permission:users.list'])->group(function() {
    Route::get('test_role', [AuthController::class, 'role']);

});






