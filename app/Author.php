<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use DateTime;

class Author extends Model
{
    protected $fillable = ['first_name','middle_name','last_name', 'real_name', 'birth_date',
                           'birth_place','death_date','death_place', 'nation_id',
                           'info','slug','photo', 'user_id'];

    public function nation()
    {
        return DB::table('nations')->where('id', $this->nation_id)->first();
    }
    
    public function getName(){
        $name = !empty($this->first_name) ? $this->first_name.' ' : '';
        $name .= $this->last_name;
        return $name;
    }
    
    public function getFullName(){
        $name = !empty($this->first_name) ? $this->first_name.' ' : '';
        $name .= !empty($this->middle_name) ? $this->middle_name.' ' : '';
        $name .= $this->last_name;
        return $name;
    }
    
    
    public function books()
    {
        return $this->hasMany('App\Book', 'author_id');
    }
    
    public function user(){
        return DB::table('users')->select('id', 'name')->where('id', $this->user_id)->first();
    } 
    
    public function getAge(){
        if(!empty($this->birth_date) or $this->birth_date!="0000-00-00"){
            $birth_day = new DateTime($this->birth_date);
            $today   = empty($this->death_date) ? new DateTime('today') : new DateTime($this->death_date);
            return $birth_day->diff($today)->y.' rokov';
        } else {
            return '';
        }
    }

   
}
