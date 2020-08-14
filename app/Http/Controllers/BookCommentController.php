<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BookComment;
use App\Http\Requests\BookCommentRequest;
use Illuminate\Support\Facades\Auth;

class BookCommentController extends Controller
{
    
    
    public function store(BookCommentRequest $request){
        if(!$u_comment= BookComment::where('user_id', Auth::id())->where('book_id', $request->input('book_id'))->first()){
            $u_comment = new BookComment($request->all());
            $u_comment->user_id = Auth::id();        
        } else{
            $u_comment->fill($request->all());
        }
            $u_comment->save();

        return back()->with('succeed', 'Ďakujeme za vaše hodnotenie knihy.');
    }
    
    public function delete($comm_id){
        if(!$u_comment=BookComment::where('user_id', Auth::id())->where('id', $comm_id)->first()){
            return back()->with('error', 'Tento komentár neexistuje!');
        }
        $u_comment->delete();
        return back()->with('succeed', 'Váše hodnotenie knihy bolo vymazané.');
    }
    
    
    
}
