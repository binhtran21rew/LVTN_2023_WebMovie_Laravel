<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class RoomResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name_room' => $this->name,
            'number_seat' => $this->seat->count(),
            'status' => $this->status,
            'schedule' => $this->schedule,
            'seat' => $this->seat
        ];
    }
}
