<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BookStatus extends Model
{
    
    protected $fillable = ['book_id', 'user_id', 'on_page', 'status'];

    
    public function book()
    {
        return $this->belongsTo('App\Book', 'book_id');
    }
}
