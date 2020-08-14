<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use App\User;

class Relation extends Model
{

        
    public function otherUser(){
        if($this->user_id_f==Auth::id()){
            $otherUser = User::where('id', $this->user_id_s)->first();
        }else{
            $otherUser = User::where('id', $this->user_id_f)->first();
        }
        return $otherUser;
    }
}
