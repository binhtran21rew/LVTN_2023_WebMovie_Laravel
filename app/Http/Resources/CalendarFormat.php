<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CalendarFormat extends JsonResource
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
            'id_movie' => $this->movie_id,
            'title' =>$this->movie->title,
            'start' => $this->date.'T'.$this->time_start,
            'end' => $this->date.'T'.$this->time_end,
            'price' => $this->price,
            'status' => $this->status,
            'color' => Carbon::now()->toDateString() > $this->date ? '#888686' : ($this->status === 1 ? '#ea300a' : '#68e609')  ,
            'dateNow' => $this->date,
        ];
    }
}
