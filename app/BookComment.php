<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Book;
use App\User;

class BookComment extends Model
{
    
    protected $fillable = ['book_id', 'user_id', 'rating', 'text'];

    
    public function book()
    {
        return $this->belongsTo('App\Book', 'book_id');
    }
    
    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }
    
}
