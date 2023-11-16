<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MovieResource extends JsonResource
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
            'title' => $this->title,
            'backdrop_path' => $this->backdrop_path,
            'poster_path' => $this->post_path,
            'time' => $this->time,
            'overview' => $this->movie_detail->overview ?? '',
            'release' => $this->release,
            'vote_count' => $this->movie_detail->vote_count ?? '',
            'vote_average' => $this->movie_detail->vote_average ?? '',
            'status' => $this->movie_detail->status ?? '',
        ];
    }
}
