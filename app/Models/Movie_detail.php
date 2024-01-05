<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Movie_detail extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'movie_detail';
    protected $fillable = ['movie_id', 'title', 'overview', 'vote_count', 'imdb', 'status'];

    public function movie(): BelongsTo{
        return $this->belongsTo(Movie::class);
    }


    public function movie_genre(): BelongsToMany{
        return $this->belongsToMany(Genre::class, 'movie_genres', 'movie_id', 'genre_id');
    }
    public function movie_genre_delete(): BelongsToMany{
        return $this
        ->belongsToMany(Genre::class, 'movie_genres', 'movie_id', 'genre_id')
        ->whereNull('movie_genres.deleted_at')
        ->withTimestamps();
    }
}
