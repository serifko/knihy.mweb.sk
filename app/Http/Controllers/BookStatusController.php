<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BookStatus;
use App\Book;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class BookStatusController extends Controller
{
   
    public function setStatus($book_id){
        if(!$book=Book::where('id', $book_id)->first()){
           return redirect('')->with('error', 'Kniha neexistuje.'); 
        } 
        if(!$book_status = BookStatus::where('book_id', $book_id)->where('user_id', Auth::id())->where('status', 0)->first()){
            $book_status = new BookStatus;
            $book_status->book_id = $book_id;
            $book_status->user_id = Auth::user()->id;
            $book_status->status = 0;
            $book_status->save();
            $message = 'Začal si čítať knihu '.$book->name.' od '.$book->author->getName().'. Tak si to uži.';
        } else {
            $book_status->status = 1;
            $book_status->save();
            $message = 'Dočítal si knihu '.$book->name.'od '.$book->author->getName().'. Napíš nám niečo o nej do hodnotenia. Ďakujeme.';
        }
        return back()->with('succeed', $message);
    }
    
    // VYPIS MOJE CITANIE
    public function index($selYear=""){
       // ROKY V KTORYCH JE ZAZNAM O NEJAKEJ KNIHE
       $bookYears = BookStatus::selectRaw("YEAR(updated_at) as year")->orderBY('year', 'DESC')->distinct()->get();
       
       //VALIDACIA ROKU, ak nepresla vybrany rok je ten posledny v ktorom bol pridana kniha
       $selYear = (int)$selYear;
       if(empty($selYear) or !is_int($selYear) or $selYear>=Date("Y") or $selYear<2015){
           $selYear = $bookYears->first()['year'];
       }
       
       //ZOZNAM KNIH PRE DANY ROK
       $book_statuses = BookStatus::where('user_id', Auth::id())
                                        ->where('updated_at','>=' ,$selYear."-01-01")
                                        ->where('updated_at','<=' ,$selYear."-12-31")
                                        ->orderBy('updated_at', 'DESC')
                                        ->paginate(20);
       $user_id = Auth::id(); //
       $book_statuses_all = BookStatus::where('user_id', Auth::id())->where('status', '1')->count();
       $book_statuses_year = BookStatus::where('user_id', Auth::id())
                                        ->where('updated_at','>=' ,$selYear.'-01-01')
                                        ->where('updated_at','<=' ,$selYear.'-12-31')
                                        ->where('status', '1')
                                        ->count();
       
       return view('book_status.index', compact('book_statuses', 'user_id', 'bookYears', 'selYear', 'book_statuses_all', 'book_statuses_year'));
        
    }
    
    public function delete($book_status_id){
        if(!$book_status = BookStatus::where('id', $book_status_id)->where('user_id', Auth::id())->first()){
            return redirect('')->with('error', 'Takýto záznam o prečítanej knihe sa v databáze nenachádza.');
        }
        $book_status->delete();
        return redirect('mojecitanie')->with('succeed', 'Záznam o prečítanej knihe bol vymazaný.');
    }
    
    
}
