<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Helper\Helper;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Contracts\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;

class AuthController extends Controller
{
    public function loginUser(LoginRequest $request){
        if(!Auth::attempt($request->only('email', 'password'))){
            Helper::sendError('Email or Password is wrong', [] ,401);
        }
        return new UserResource(auth()->user());
        // return auth()->user()->doesntHave('permissions')->get();

    }

    public function registerUser(RegisterRequest $request){
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        $user_role = Role::where(['name' => 'user'])->first();
        if($user_role){
            $user->assignRole($user_role);
        }

        return new UserResource($user);
    }

    public function logout(){
        auth()->user()->tokens()->delete();
       
        return  response()->json([
            'status' => 200,
            'message' => 'Logout Successfully'
        ]);
    

    }

    public function user(){
        return auth()->user();
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
