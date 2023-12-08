<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'user_id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'token' => $this->getRoleNames()->diff(['user'])->all() === [] 
            ?  $this->createToken($this->email.'_AdminToken', ['server:user'])->plainTextToken 
            :  $this->createToken($this->email.'_userToken', ['server:admin'])->plainTextToken,
            'roles' => $this->roles->pluck('name') ?? [],
            'roles.permission' => $this->getPermissionsViaRoles()->pluck('name') ?? [],
            'permissions' => $this->getPermissionNames() ?? [],

            'booking' => $this->booking,
        ];
    }


}
