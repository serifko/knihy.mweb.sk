<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Author;
use App\Book;

class Quote extends Model
{
    protected $fillable = ['text', 'author_id', 'book_id', 'quoteCategory_id', 'user_id'];
    
    
    
    public function author()
    {
        return $this->belongsTo('App\Author', 'author_id');
    }
    
    public function book()
    {
        return $this->belongsTo('App\Book', 'book_id'); 
    }
    
    
}
