<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Author;
use App\Book;
use App\Quote;
use App\BookComment;
use App\News;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{


    public function index()
    {
      $stat = [];
      $points = null;
      $news = null;
        if(Auth::check()){
            $user_id = Auth::id();
            $this_year = Date("Y");
            $prev_year = Date("Y",strtotime("-1 year"));

            $stat['read'] = DB::table('book_statuses')->where('user_id', $user_id)->where('status', 1)->count();
            $stat['read_ty'] = DB::table('book_statuses')->where('user_id', $user_id)->where('status', 1)->where('updated_at', '>=', $this_year."-01-01")->where('updated_at', '<=', $this_year."-12-31")->count();
            $stat['read_py'] = DB::table('book_statuses')->where('user_id', $user_id)->where('status', 1)->where('status', 1)->where('updated_at', '>=', $prev_year."-01-01")->where('updated_at', '<=', $prev_year."-12-31")->count();
            $stat['read_cur'] = DB::table('book_statuses')->where('user_id', $user_id)->where('status', 0)->count();

            $stat['author_add'] = Author::where('user_id', $user_id)->count();
            $stat['book_add'] = Book::where('user_id', $user_id)->count();
            $stat['book_comm_add'] = BookComment::where('user_id', $user_id)->count();
            $stat['quote_add'] = Quote::where('user_id', $user_id)->count();

            $points = $stat['read'] + $stat['read_cur'] + 3*$stat['author_add']+3*$stat['book_add']+2*$stat['book_comm_add']+3*$stat['quote_add'];

        }else{
            $news = News::where('public_at', '<=', Date("Y-m-d H:i:s"))->orderBy('public_at', 'DESC')->limit(3)->get();
        }


        return view('home.home', compact('stat', 'points', 'news'));
    }




    public function autocompleteSearch()
    {
        $term = Input::get('search');
        $results = array();
        $author_queries = Author::where('first_name', 'LIKE', '%'.$term.'%')->orWhere('last_name', 'LIKE', '%'.$term.'%')->orWhere('real_name', 'LIKE', '%'.$term.'%')->get();
        $book_queries = Book::where('name', 'LIKE', '%'.$term.'%')->orWhere('original_name', 'LIKE', '%'.$term.'%')->get();
        foreach ($author_queries as $query)
	{
	    $results[] = [ 'link' => url('autor/'.$query->slug), 'name' => $query->getName()];
        }
        foreach ($book_queries as $query)
	{
	    $results[] = [ 'link' => url('kniha/'.$query->slug), 'name' => $query->name.' - '.$query->author->getName()];
        }
        return response()->json($results);
    }


    public function contact(){
        return view('home.contact');
    }
    public function sendContact(Request $request){
        $validator = $this->validateContact($request);
	if ($validator->fails()) return redirect('kontakt')->withErrors($validator)->withInput();
        DB::table('contacts')->insert([
                        'email'=>trim(Input::get('email')),
                        'message'=>trim(Input::get('message')),
                        'user_id'=>Auth::check() ? Auth::id() : '0',
        ]);
        return redirect('kontakt')->with('succeed', 'Vaša správa bola odoslaná administrátorom. Ďakujeme.');
    }
    public function validateContact($request)
    {
        $messages=[
		'email.required'=>'Email musí obsahovať platnú emailovú adresu.',
		'email.email'=>'Email musí obsahovať platnú emailovú adresu.',
		'message.required'=>'Musíte napísať správu pre administrátora.',
		'message.min'=>'Správa pre administrátora musí mať minimálne :min znakov.',
                'message.max'=>'Správa pre administrátora môže mať maximálne :max znakov.',
                'g-recaptcha-response.required'=>'Musíš potvrdiť že nie si robot!',
                'g-recaptcha-response.captcha'=>'Musíš potvrdiť že nie si robot!',
	];
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'message' => 'required|min:10|max:1500',
            'g-recaptcha-response' => 'required|captcha'
        ], $messages);
	return $validator;
    }

}
