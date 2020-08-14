<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Relation;
use App\User;
use Illuminate\Support\Facades\Auth;

class RelationController extends Controller
{
    
    
    //PRIATELIA
    public function index(){
        $user_id = Auth::id();
        
        $friendships = Relation::where('user_id_f', Auth::id())->where('status', 1)->orWhere('user_id_s', Auth::id())->where('status', 1)->paginate(30);
               
        $friendMyRequests = Relation::where('user_id_f', $user_id)->where('status', 0)->get();
        $friendRequests = Relation::where('user_id_s', $user_id)->where('status', 0)->get();
        
        return view('relation.index', compact('friendships', 'friendMyRequests', 'friendRequests'));
        
        
    }
        
    //POSLANIE ZIADOSTI O PRIATELSTVO
    public function sendReq($user_id){
        if(!$user=User::select('id')->where('id', $user_id)->first()) return back()->with('error', 'Užívateľ neexistuje.');
        $user_id_f = Auth::id();
        $user_id_s = $user->id;
        
        if($existRel = Relation::where('user_id_f', $user_id_f)->where('user_id_s', $user_id_s)->orWhere('user_id_f', $user_id_s)->where('user_id_s', $user_id_f)->first()){
            if($existRel->blockeed == 1){
                $msg = "Kontakt medzi tebou a týmto užívateľom je zablokovaná na žiadosť jedného z Vás.";
            } elseif ($existRel->status == 1) {
                $msg = "Žiadosť o priateľstvo bola odoslaná, čaká sa na jej schválenie.";
            } elseif ($existRel->status == 2) {
                $msg = "S týmto užívateľom už ste priatelia.";
            } else{
                $msg = "Chyba na stránke.";
            }
            return $msg;
            return back()->with('succeed', 'Žiadosť o priateľstvo bola odoslaná.');
        }
             
        $relReq = new Relation();
        $relReq->user_id_f = $user_id_f;
        $relReq->user_id_s = $user_id_s;
        $relReq->save();
        return back()->with('succeed', 'Žiadosť o priateľstvo bola odoslaná.');
    }
    
    //POTVRDENIE PRIATELSTVA
    public function confReq($user_id){
        if($existRel = Relation::where('user_id_f', $user_id)->where('user_id_s', Auth::id())->where('status', 0)->first()){
            $existRel->status = 1;
            $existRel->save();
            return back()->with('succeed', 'Žiadosť o priateľstvo bola pridaná.');
     
        } else{
            return back()->with('error', 'Žiadosť o priateľstvo neexistuje.');
        }               
    }
    
    //ZRUSENIE PRIATELSTVA
    public function delFriend($user_id){
        if($existRel = Relation::where('user_id_f', $user_id)->where('user_id_s', Auth::id())->where('status', 1)
                ->orWhere('user_id_f', Auth::id())->where('user_id_s', $user_id)->where('status', 1)->first()){
            $existRel->delete();
            return redirect('priatelia')->with('succeed', 'Priateľstvo bolo zrušené.');
     
        } else{
            return back()->with('error', 'Priateľstvo sa nepodarrilo zrušiť.');
        }               
    }
    
    
    //ZOBRAZENIE BLOKOVANI
    public function blocked(){
        $myBlocks = Relation::where('user_id_f', Auth::id())->where('blocked_by',Auth::id())->where('blocked', 1)
                ->orWhere('user_id_s', Auth::id())->where('blocked_by',Auth::id())->where('blocked', 1)->get();
        $iBlocks = Relation::where('user_id_f', Auth::id())->where('blocked_by', '<>' ,Auth::id())->where('blocked', 1)
                ->orWhere('user_id_s', Auth::id())->where('blocked_by', '<>', Auth::id())->where('blocked', 1)->get();
        return view('relation.blocked', compact('myBlocks', 'iBlocks'));
    }
    
    
    // ZABLOKOVANIE UŽÍVATELA
    public function setBlock($user_id){
        if(Auth::id() == $user_id){
            return back()->with('error', 'Nemôžeš zablokovať sám seba.');
        }
            
        if(!$friendships = Relation::where('user_id_f', Auth::id())->where('user_id_s', $user_id)->orWhere('user_id_f', $user_id)->where('user_id_s', Auth::id())->first()){
            $friendships = new Relation();
            $friendships->user_id_f = Auth::id();
            $friendships->user_id_s = $user_id;
        }
        $friendships->blocked = 1;
        $friendships->blocked_by = Auth::id();
        $friendships->status = 0;
        $friendships->save();
        return back()->with('succeed', 'Užívateľ '.$friendships->otherUser()->getUsername().' bol zablokovaný.');
    }
    
    // ZRUŠENIE BLOKOVANIA
    public function cancBlock($user_id){
        if(Auth::id() == $user_id){
            return back()->with('error', 'Nemôžeš blokovať sám seba.');
        }
            
        if(!$friendships = Relation::where('user_id_f', Auth::id())->where('user_id_s', $user_id)->where('blocked_by', Auth::id())->where('blocked', 1)
                ->orwhere('user_id_f', $user_id)->where('user_id_s', Auth::id())->where('blocked_by', Auth::id())->where('blocked', 1)
                ->first()){
            return back()->with('error', 'Nemôžeš zrušiť toto zablokovanie.');
        }
        
        $friendships->blocked_by = NULL;
        $friendships->blocked = 0;
        $friendships->delete();
        
        return back()->with('succeed', 'Blokovanie užívateľa '.$friendships->otherUser()->getUsername().' bolo zrušené.');
    }
    
    
    
    
}
