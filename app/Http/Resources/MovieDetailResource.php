<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MovieDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->movie_id,
            'title' => $this->movie['title'],
            'backdrop_path' => $this->movie['backdrop_path'],
            'poster_path' => $this->movie['poster_path'],
            'overview' => $this->overview,
            'time' => $this->movie['time'],
            'release' => $this->movie['release'],
            'vote_count' => $this->vote_count,
            'vote_average' => $this->vote_average,
            'status' => $this->status,
            'genres' => [
                $this->movie_genre
            ],
        ];
    }
}
