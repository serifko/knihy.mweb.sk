<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Quote;
use App\Http\Requests\QuoteStoreRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Author;

class QuoteController extends Controller
{
    
    
    public function index($select=""){
        switch($select){
            case "najoblubenejsie":
                $quotes = Quote::orderBy('votes', 'DESC')->paginate(15);
                $headtitle="Najobľúbenejšie citáty";
                break;
            default:
                $quotes = Quote::orderBy('created_at', 'DESC')->paginate(15);
                $headtitle="Najnovšie citáty";
        }
        return view('quote.index', compact('quotes', 'headtitle'));
    }
    
    public function indexTwo(){
      return view('quote.indexTwo');
    }
    
    public function author($author_slug){
        if(!$author = Author::where('slug', $author_slug)->first()) return redirect('citaty')->with('error', 'Autor sa v databáze nenachádza.');
        $quotes = Quote::where('author_id', $author->id)->paginate(15);
        return view('quote.author', compact('author', 'quotes'));        
    }
    
    
   public function autor($url=""){

        $quotes = Quote::orderBy('created_at', 'DESC')->paginate(15);

        return view('quote.index', compact('quotes', 'title'));
    }
    
    
    
    
    
    

    public function show($quote_id){
        if(!$quote = Quote::where('id', $quote_id)->first()) return redirect('citaty')->with('error', 'Takýto citát sa v databáze už nenachádza.');
        $fb_metas = [
            "url" => url('citat/'.$quote_id),
            "title" => 'Citát od '.$quote->author->getName().' na stránke kniharen.sk',
            "description" => $quote->text,
            "image" =>  asset('public/images/quote_fbshare.png'),
            "type" => "books.quotes",
        ];
        return view('quote.show', compact('quote', 'fb_metas'));
        
    }



    public function create(){
        $quoteCategories = DB::table('quote_categories')->orderBy('nazov', 'ASC')->get();
        return view('quote.create', compact('quoteCategories'));  
    }
    
    public function store(QuoteStoreRequest $request){
        $quote = new Quote($request->all());
        $quote->user_id = Auth::check() ? Auth::id() : 1;
        $quote->save();
        
        return redirect('citat/pridat')->with('succeed', 'Citát bol uložený. Ďakujeme.');               
    }
    
    
    public function edit($quote_id){
        if(!$quote = Quote::find($quote_id)) return back()->with('error', 'Citát s týmto ID neexistuje.');
        $quoteCategories = DB::table('quote_categories')->orderBy('nazov', 'ASC')->get();
        return view('quote.edit', compact('quote', 'quoteCategories'));        
    }
        
    public function update(QuoteStoreRequest $request, $quote_id){
        if(!$quote = Quote::find($quote_id)) return back()->with('error', 'Citát s týmto ID neexistuje.');
        $quote->fill($request->all());
        $quote->save();
        return redirect('citat/'.$quote_id.'/upravit')->with('succeed', 'Citát bol upravená. Ďakujeme.'); 
    }
    
    public function delete($book_id){
        if(!$quote = Quote::find($quote_id)) return redirect ('citaty')->with('error', 'Citát s týmto ID neexistuje.');
        $quote->delete();
        return redirect ('citaty')->with('succeed', 'Citát bol vymazaný.');
    }     
    
    
    public function vote($quote_id){
        if (!empty(session('quote_vote_'.$quote_id))) return false;
        
        $quote = Quote::find($quote_id);
        $quote->votes++;
        $quote->save();       
        //create session and cookies
       // $request->session()->put('quote_vote_'.$quote_id, true);
        //$response->withCookie(cookie()->forever('quote_vote_'.$quote_id, true));
        
        cookie($name = 'quote_vote_'.$quote_id, $value = true, $minutes = 60*24*30);
        session(['quote_vote_'.$quote_id => true]);
        return $quote->votes;
    }
    
    
    
}
