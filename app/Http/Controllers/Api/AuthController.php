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
use Spatie\Permission\Contracts\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;

class AuthController extends Controller
{

    private $user;
    public function __construct (User $user){
        $this->user = $user;
    }
    public function loginUser(LoginRequest $request){
        if(!Auth::attempt($request->only('email', 'password'))){
            Helper::sendError('Email or Password is wrong', [] ,401);
        }
        return new UserResource(auth()->user());
    }

    public function registerUser(RegisterRequest $request){
        try{
            DB::beginTransaction();
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);
    
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
                'message' => 'register successfully !',
                'data' => new UserResource(auth()->user())
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 200,
                'message' => 'register is wrong !',
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
        $checkUser = $this->user->with(['booking.ticket.schedule.movie', 'booking.payment'])->find(auth()->user()->id);
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
    
            // $user_role = Role::where(['name' => 'admin'])->first();

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

    public function updateAccount(Request $request){
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
    // public function grant(){
    //     $super = Role::create(['name' => 'super admin']);
    //     $user = User::create([
    //         'name' => 'AdminRoot',
    //         'email' => 'AdminRoot@gmail.com',
    //         'password' => bcrypt('Adminroot123')
    //     ]);
    //     $user->assignRole($super);
    // }


}
