<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BookingController;
use App\Http\Controllers\Api\MovieController;
use App\Http\Controllers\Api\CastController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\FoodController;
use App\Http\Controllers\Api\Trailers;
use App\Http\Controllers\Api\GenreController;
use App\Http\Controllers\Api\MailController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\RolePermissionController;
use App\Http\Controllers\Api\RoomController;
use App\Http\Controllers\Api\ScheduleController;
use App\Http\Controllers\Api\VerificationController;
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

Route::post('email/verification-notification', [VerificationController::class, 'sendEmailVerification'])->middleware('auth:sanctum');
Route::get('verify-email/{id}/{hash}', [VerificationController::class, 'verify'])->name('verification.verify')->middleware('auth:sanctum');
Route::get('email/resend', [VerificationController::class, 'resend']);
Route::get('send-mail', [MailController::class, 'sendMail']);
// Route::prefix('web')->group(function () {
//     Route::get('/movies/getall', [MovieController::class, 'getAll']);
// });
    Route::post('search/movie/', [MovieController::class, 'searchMovie']);

    Route::get('/Movie/page/{page}', [MovieController::class, 'getPage'])->name('website-user');
    Route::get('/Movie/detail/{id}', [MovieController::class, 'movieDetail']);
    Route::get('/Movie/getAll', [MovieController::class, 'getAll']);
    Route::get('/Movie/getContent/{type}', [MovieController::class, 'getMovieContent']);
    Route::get('/Movie/getMovie/{id}', [MovieController::class, 'getMovieId']);
    Route::get('/Movie/getSchedule',  [MovieController::class, 'getMovieSchedule']);

    Route::get('/Cast/detail/{id}',[CastController::class, 'detail']);
    Route::get('/Cast/getAll', [CastController::class, 'getAll']);

    Route::get('/Trailer/getTrailer/{id}', [Trailers::class, 'getTrailer']);
    Route::get('/Trailer/getAll', [Trailers::class, 'getAllTrailer']);

    Route::get('/Genre/getAll', [GenreController::class, 'getAll']);

    Route::get('/Room/getAll', [RoomController::class, 'getAll']);
    Route::get('/Room/getAvailable', [RoomController::class, 'getAvailable']);


    Route::get('Schedule/getBookingSchedule/{movie}', [ScheduleController::class, 'getBookingSchedule']);
    Route::get('Schedule/getTicket/{schedule}', [ScheduleController::class, 'getTicket']);

    Route::post('Booking/BookingTicket', [BookingController::class, 'bookingTicket']);

    Route::get('Food/getAll', [FoodController::class, 'getAllFood']);
    Route::get('ComboFood/getAll', [FoodController::class, 'getAllComboFood']);
    Route::get('Food/available', [FoodController::class, 'getAvailableFood']);

Route::middleware(['auth:sanctum', 'isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });

    Route::get('/Account/getUser', [AuthController::class, 'getUserAccount']);
    Route::get('/Dashboard/Account', [DashboardController::class, 'dashboardAccount']);
    Route::get('/Dashboard/Movie', [DashboardController::class, 'dashboardMovie']);
    Route::get('/Dashboard/Schedule', [DashboardController::class, 'dashboardSchedule']);
    Route::post('/Booking/admin/BookingTicket', [BookingController::class, 'adminBookingTicket']);


    //Controller Authentication ===================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-account|admin_update-account|admin_delete-account']], function () {
        Route::get('/Account/getAll', [AuthController::class, 'getAccount'])->name('admin_get-account');
    });
    Route::group(['middleware' => ['role_or_permission:admin_create-account']], function () {
        Route::post('/Account/createAccount', [AuthController::class, 'createAccount'])->name('admin_create-account');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-account']], function () {
        Route::post('/Account/updateRole', [AuthController::class, 'updateRoleAccount'])->name('admin_update-account');
    });

    Route::group(['middleware' => ['role_or_permission:admin_delete-account']], function () {
        Route::delete('/Account/deleteAccount', [AuthController::class, 'deleteAccount'])->name('admin_delete-account');
    });
    Route::get('search/Account', [AuthController::class, 'searchAccount']);



    //Controller Movie ===========================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-movie']], function () {
        Route::post('/Movie/createMovie', [MovieController::class, 'createMovie'])->name('admin_create-movie');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-movie']], function () {
        Route::post('/Movie/updateMovie', [MovieController::class, 'updateMovie'])->name('admin_update-movie');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-movie']], function () {
        Route::delete('/Movie/deleteMovie', [MovieController::class, 'deleteMovie'])->name('admin_delete-movie');
        Route::get('/Movie/getTrashed/Movie', [MovieController::class, 'getTrashed'])->name('admin_delete-movie');
    });
    Route::get('/Movie/getMovie', [MovieController::class, 'getAdminMovie'])->name('admin_getAdmin-movie');
    Route::get('/search/Movie/', [MovieController::class, 'searchMovieAdmin']);



    //Controller Cast ============================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-cast']], function () {
        Route::post('/Cast/createCast', [CastController::class, 'createCast'])->name('admin_create-cast');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-cast']], function () {
        Route::post('/Cast/updateCast', [CastController::class, 'updateCast'])->name('admin_update-cast');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-cast']], function () {
        Route::delete('/Cast/deleteCast', [CastController::class, 'deleteCast'])->name('admin_delete-cast');
        Route::get('/Cast/getTrashed/Cast', [CastController::class, 'getTrashed'])->name('admin_delete-cast');
    });
    Route::get('/search/Cast/', [CastController::class, 'searchCast']);

    
    //Controller Trailer =========================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-trailer']], function () {
        Route::post('Trailer/createTrailer', [Trailers::class, 'createTrailer'])->name('admin_create-trailer');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-trailer']], function () {
        Route::post('Trailer/updateTrailer', [Trailers::class, 'updateTrailer'])->name('admin_update-trailer');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-trailer']], function () {
        Route::delete('Trailer/deleteTrailer', [Trailers::class, 'deleteTrailer'])->name('admin_delete-trailer');
        Route::get('Trailer/getTrashed/Trailer', [Trailers::class, 'getTrashed'])->name('admin_delete-trailer');
    });
    Route::get('/search/Trailer/', [Trailers::class, 'searchTrailer']);


    
    //Controller Genre ============================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-genre']], function () {
        Route::post('Genre/createGenre', [GenreController::class, 'createGenre'])->name('admin_create-genre');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-genre']], function () {
        Route::post('Genre/updateGenre', [GenreController::class, 'updateGenre'])->name('admin_update-genre');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-genre']], function () {
        Route::delete('/Genre/deleteGenre', [GenreController::class, 'deleteGenre'])->name('admin_delete-genre');
        Route::get('/Genre/getTrashed/Genre', [GenreController::class, 'getTrashed'])->name('admin_delete-genre');
    });
    Route::get('/search/Genre/', [GenreController::class, 'searchGenre']);


    //Controller Room =============================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-room']], function () {
        Route::post('Room/createRoom', [RoomController::class, 'createRoom'])->name('admin_create-room');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-room']], function () {
        Route::post('Room/updateRoom', [RoomController::class, 'updateRoom'])->name('admin_update-room');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-room']], function () {
        Route::delete('/Room/deleteRoom', [RoomController::class, 'deleteRoom'])->name('admin_delete-room');
        Route::get('/Room/getTrashed/Room', [RoomController::class, 'getTrashed'])->name('admin_delete-room');
    });
    Route::get('/search/Room/', [RoomController::class, 'searchRoom']);
    Route::get('Room/getRoom/{id}', [RoomController::class, 'getRoom']);
    Route::post('Room/change_room', [RoomController::class, 'changeRoom']);




    //Controller Schedule ==========================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-schedule']], function () {
        Route::post('Schedule/createSchedule', [ScheduleController::class, 'createSchedule'])->name('admin_create-schedule');
        Route::get('Schedule/getSchedule', [ScheduleController::class, 'getAllSchedule'])->name('admin_getAll-schedule');
        Route::get('Schedule/getSchedule/{room}', [ScheduleController::class, 'getSchedule'])->name('admin_get-schedule');

    });
    Route::group(['middleware' => ['role_or_permission:admin_update-schedule']], function () {
        Route::get('Schedule/getSchedule', [ScheduleController::class, 'getAllSchedule'])->name('admin_getAll-schedule');
        Route::get('Schedule/getSchedule/{room}', [ScheduleController::class, 'getSchedule'])->name('admin_get-schedule');
        Route::post('Schedule/updateSchedule', [ScheduleController::class, 'updateSchedule'])->name('admin_update-schedule');
    });
    Route::group(['middleware' => ['role_or_permission:admin_getAll-schedule|admin_get-schedule']], function () {
        Route::get('Schedule/getSchedule/{room}', [ScheduleController::class, 'getSchedule'])->name('admin_get-schedule');
    });


    //Controller Food ================================================================
    Route::group(['middleware' => ['role_or_permission:admin_create-food']], function () {
        Route::post('Food/createFood', [FoodController::class, 'createFood'])->name('admin_create-food');
        Route::post('ComboFood/createComboFood', [FoodController::class, 'createComboFood'])->name('admin_create-food');
    });
    Route::group(['middleware' => ['role_or_permission:admin_update-food']], function () {
        Route::post('Food/updateFood', [FoodController::class, 'updateFood'])->name('admin_update-food');
        Route::post('ComboFood/updateComboFood', [FoodController::class, 'updateComboFood'])->name('admin_update-food');
    });
    Route::group(['middleware' => ['role_or_permission:admin_delete-food']], function () {
        Route::delete('Food/deleteFood', [FoodController::class, 'deleteFood'])->name('admin_delete-food');
        Route::post('/Food/getTrashed/Food', [FoodController::class, 'getTrashed'])->name('admin_delete-food');
    });
    Route::get('/search/ComboFood/', [FoodController::class, 'searchFood']);



    //Controller Booking ===============================================================
    Route::group(['middleware' => ['role_or_permission:admin_getAll-booking']], function () {
        Route::get('Booking/getAll', [BookingController::class, 'getAllBookingAdmin'])->name('admin_getAll-booking');
        Route::get('Booking/getChartData', [BookingController::class, 'getChartData'])->name('admin_getAll-booking');
        Route::get('search/Booking/', [BookingController::class, 'searchBooking'])->name('admin_getAll-booking');
        Route::post('Booking/ChangeBookingTicket', [BookingController::class, 'ChangeBookingTicket'])->name('admin_getAll-booking');

    });


    //Controller RolePermission
    Route::group(['middleware' => ['role_or_permission:admin_getAll-rolePermissions']], function () {
        Route::get('RolePermission/getAllPermission', [RolePermissionController::class, 'getAllPermission'])->name('admin_getAll-rolePermissions');
        Route::get('RolePermission/getAllRole', [RolePermissionController::class, 'getAllRole'])->name('admin_getAll-rolePermissions');
        Route::post('Role/createRole', [RolePermissionController::class, 'createRole'])->name('admin_getAll-rolePermissions');
        Route::post('Role/updateRole', [RolePermissionController::class, 'updateRole'])->name('admin_getAll-rolePermissions');
    });

    Route::group(['middleware' => ['role_or_permission:admin_delete-rolePermissions']], function () {
        Route::delete('Role/deleteRole', [RolePermissionController::class, 'deleteRole'])->name('admin_delete-rolePermissions');;
    });
});





Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'user']);

    Route::post('Account/updateAccount', [AuthController::class, 'updateAccount']);

    Route::post('change_password', [AuthController::class, 'change_password']);
});



// Authorization user with role or permissions
Route::middleware(['auth:sanctum','verified'])->group(function() {
    Route::post('/Payment/momo', [PaymentController::class, 'momoPayment']);
    Route::post('/Payment/vnpay', [PaymentController::class, 'vnpayMethod']);

    Route::get('test_role', function(Request $request){
        return $request->user();
    });
});






