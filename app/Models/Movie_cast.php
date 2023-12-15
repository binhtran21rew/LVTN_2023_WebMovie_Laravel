<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Movie_cast extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'movie_casts';

    protected  $fillable = ['movie_id', 'cast_id'];

    
}
