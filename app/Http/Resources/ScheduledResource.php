<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ScheduledResource extends JsonResource
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
            'room' => $this->room->name,
            'movie' => $this->movie->title,
            'post_path' => $this->movie->post_path,
            'date' => $this->date,
            'price' => $this->price,
            'time_start' => $this->time_start,
            'time_end' => $this->time_end,
            'ticket' => $this->ticket,
        ];
    }
}
