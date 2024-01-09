<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Helper\Helper;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Resources\AccountResource;
use App\Http\Resources\UserResource;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Illuminate\Http\JsonResponse;
use Laravel\Socialite\Contracts\User as SocialiteUser;
use Laravel\Socialite\Facades\Socialite;
use GuzzleHttp\Exception\ClientException;
class AuthController extends Controller
{

    private $user;
    public function __construct (User $user){
        $this->user = $user;
    }
    public function loginUser(LoginRequest $request){
        if(!Auth::attempt($request->only('email', 'password'))){
            return response()->json([
                'status' => 401,
                'message' => 'Email or Password is wrong',
            ]); 
        }
        return response()->json([
            'status' => 200,
            'data' => new UserResource(auth()->user())
        ]);
    }

    public function registerUser(RegisterRequest $request){
        try{
            DB::beginTransaction();
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);
            $user->sendEmailVerificationNotification();
            $user_role = Role::where(['name' => 'user'])->first();
            if($user_role){
                $user->assignRole($user_role);
            }
            if(!Auth::attempt($request->only('email', 'password'))){
                Helper::sendError('Email or Password is wrong', [] ,401);
            }
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Next. You have verify your email to booking ticket',
                'data' => new UserResource(auth()->user())
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => $e->getMessage(),
            ]);
        }

    }

    public function logout(){
        auth()->user()->tokens()->delete();
       
        return  response()->json([
            'status' => 200,
            'message' => 'Logout Successfully'
        ]);
    

    }

    public function user(){
        $checkUser = $this->user->with(['booking.ticket.schedule.movie', 'booking.payment', 'booking.combofood'])->find(auth()->user()->id);
        return new AccountResource($checkUser);
    }

    public function getAccount(){
        $users = $this->user->with('roles')->get();

        return $users;
    }
    public function createAccount(RegisterRequest $request){
        try{
            DB::beginTransaction();
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'genders' => $request->gender,
                'phone' => $request->phone
            ]);
    

            if(isset($request->role)){
                foreach($request->role as $role){
                    $ids = Role::find($role);
                    $roles[] = $ids->id;
                }
                $user->syncRoles($roles);
            }else{
                $user_role = Role::where(['name' => 'admin'])->first();
                if($user_role){
                    $user->syncRoles($user_role);
                }
            }

            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'register successfully!',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => $e->getMessage(),
            ]);
        }
    }

    public function updateRoleAccount(Request $request){
        $checkAccount = User::find($request->id);
        if($checkAccount->hasAnyRole('root_admin')){
            return response()->json([
                'status' => 401,
                'message' => 'You can not update root admin account',
            ]);
        }

        try{
            DB::beginTransaction();
            if(isset($request->role)){
                foreach($request->role as $role){
                    $ids = Role::find($role);
                    $roles[] = $ids->id;
                }
                $checkAccount->syncRoles($roles);
            }else{
                $user_role = Role::where(['name' => 'admin'])->first();
                if($user_role){
                    $checkAccount->syncRoles($user_role);
                }
            }
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'update account role successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 200,
                'message' => $e->getMessage(),
            ]);
        }

        

    }

    public function deleteAccount(Request $request){
        $checkAccount = User::find($request->id);
        if($checkAccount->hasAnyRole('root_admin')){
            return response()->json([
                'status' => 401,
                'message' => 'You can not update root admin account',
            ]);
        }
        try{
            DB::beginTransaction();
            $checkAccount->syncRoles([]);
            $checkAccount->delete();
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'delete account successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 200,
                'message' => $e->getMessage(),
            ]);
        }
    }

    public function getUserAccount(){
        $user = $this->user->with('roles')->find(auth()->user()->id);
        return $user;

    }

    public function updateAccount(Request $request){
        $checkUser = $this->user->find($request->id);
        if($checkUser){
            try{
                DB::beginTransaction();
                $data = [
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'gender' => $request->gender
                ];
                $checkUser->update($data);
                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => 'update infomation account successfully',
                ]);
            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => $e->getMessage(),
                ]);
            }
        }else{
            return response()->json([
                'status' => 401,
                'message' => 'Account not found',
            ]);
        }
    }

    public function change_password(Request $request){
        $user = $this->user->find($request->id);
        $checkUser = auth()->user();
        if(Hash::check($request->old_password, $checkUser->password) && $user){
            try{
                DB::beginTransaction();
                $user->update([
                    'password' => bcrypt($request->new_password)
                ]);

                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => 'change password successfully',
                ]);

            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => $e->getMessage(),
                ]);
            }
        }
       
        return response()->json([
            'status' => 401,
            'message' => 'old password not match',
        ]);
    }

    public function searchAccount(Request $request){
        if($request->filter === 'user'){
            $result = $this->user->with('roles')->where('name', 'like', '%'.$request->keyword.'%')->get();
        }else if($request->filter === 'admin'){
            $result = $this->user->with('roles')->where('name', 'like', '%'.$request->keyword.'%')->get();
        }

        return $result;
    }
}
