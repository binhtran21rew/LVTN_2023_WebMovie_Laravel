<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolePermissionController extends Controller
{
    function __construct(){
        $this->middleware('role_or_permission:admin_getAllRolePermissions', ['only' => 'getAllPermission']);

    }
    public function getAllPermission(){
        $permission = Permission::all();


        return $permission ;
    }
    // $role = Role::find(7);
    // foreach($permission as $a){
    //     $role->givePermissionTo($a);
    // }

    // // $user->assignRole($permission);
}
