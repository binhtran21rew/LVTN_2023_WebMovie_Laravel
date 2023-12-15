<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingResource extends JsonResource
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
            'count' => $this->count,
            'price' => $this->total_price,
            'date' => $this->date,
            'status' => $this->status,
            'user' => $this->user,
            'ticket' => $this->ticket,
            'payment' => $this->payment,
            'food' => $this->combofood,
        ];
    }
}
