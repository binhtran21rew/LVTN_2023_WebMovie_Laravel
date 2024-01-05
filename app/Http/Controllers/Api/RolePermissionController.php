<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolePermissionController extends Controller
{   
    private $role;
    private $permission;
    private $user;
    function __construct(Role $role, Permission $permission, User $user){

        $this->role = $role;
        $this->permission = $permission;
        $this->user = $user;
    }
    public function getAllPermission(){
        $permission = Permission::all();


        return $permission ;
    }

    public function getAllRole(){
        $roles = $this->role->with('permissions')->get();

        return $roles;
    }

    public function createRole(Request $request){
        $checkRole =  $this->role->where(['name' => $request->name])->get();

        if($checkRole->count() !== 0){
            return response()->json([
                'status' => 401,
                'message' => 'There have a role name',
            ]); 
        }
        try{
            DB::beginTransaction();
            foreach($request->permissions as $value){
                $ids = $this->permission->find($value);
                $permission[] = $ids->id;
            }
            $role = $this->role->create(['name' => $request->name, 'guard_name' => 'web']);
            $role->syncPermissions($permission);
            
            DB::commit();
            return response()->json([
                'status' => 200,
                'message' => 'Created role successfully',
            ]);
        }catch(Exception $e){
            DB::rollBack();
            return response()->json([
                'status' => 401,
                'message' => $e->getMessage(),
            ]); ;
        }
        
    }

    public function updateRole(Request $request){
        $role = $this->role->find($request->id);
        if($role->name === 'root_admin'){
            return response()->json([
                'status' => 401,
                'message' => 'You can not update root admin role.',
            ]); 
        }
        if($role){
            try{
                DB::beginTransaction();
                // $per = [];
                foreach($request->permissions as $value){
                    $ids = $this->permission->find($value);
                    $permission[] = $ids->id;
                }
                $role->syncPermissions($permission);
                
                DB::commit();
                return response()->json([
                    'status' => 200,
                    'message' => 'Update role successfully',
                ]);
            }catch(Exception $e){
                DB::rollBack();
                return response()->json([
                    'status' => 401,
                    'message' => $e->getMessage(),
                ]); ;
            }
        }
        return response()->json([
            'status' => 401,
            'message' => 'The role is not exist',
        ]); 

        
    }

    public function deleteRole(Request $request){
        $permission = [];
        $role = $this->role->find($request->id);

        if($role->name === 'root_admin'){
            return response()->json([
                'status' => 401,
                'message' => 'You can not delete root admin role.',
            ]); 
        }

        $superAdminCount = $this->user->with('roles')->get()->filter(
            fn ($user) => $user->roles->where('id', $request->id)->toArray()
        )->count();
        if( $superAdminCount !== 0){
            return response()->json([
                'status' => 401,
                'message' => 'Another user use this role. Can not delete !',
            ]); 
        }else{
            $role->syncPermissions($permission);
            $role->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Delete role successfully',
            ]); 
        }
    }

}
