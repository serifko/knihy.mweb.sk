<?php

namespace App\Http\Controllers;

use App\Book;
use App\Author;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\BookStoreRequest;
use App\Http\Requests\BookUpdateRequest;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Input;
use App\BookStatus;
use App\BookComment;
use App\FavoritBook;

class BookController extends Controller
{

    public function index(){
        $books = Book::orderBy('created_at', 'DESC')->paginate(20);
        return view('book.index', compact('books'));
    }

    public function show($book_slug){
        if(!$book = Book::where('slug', $book_slug)->first()) return redirect('knihy')->with('error', 'Kniha sa v databáze nenachádza.');
            $book_status_count = Auth::check() ? DB::table('book_statuses')->where('user_id', Auth::user()->id)->where('book_id', $book->id)->where('status', 1)->count() : 0;
            $bookstatus = Auth::check() ? BookStatus::where('user_id', Auth::user()->id)->where('book_id', $book->id)->where('status', 0)->first() : null;
            $is_favorit = Auth::check() ? DB::table('favorit_book')->where('book_id', $book->id)->where('user_id', Auth::id())->count() : 0;
            $u_comment = new BookComment;
            if(Auth::check()){
              if(!$u_comment = BookComment::where('user_id', Auth::id())->where('book_id', $book->id)->first()){
                  $u_comm_exist = FALSE;
                  $u_comment = new BookComment();
              }else{
                  $u_comm_exist = TRUE;
              }
            }else{
              $u_comm_exist = FALSE;
            }
        $comments_p = $book->comments()->where('text', '<>', '')->orderBy('created_at', 'DESC')->paginate(5);
        return view('book.show', compact('book', 'bookstatus', 'book_status_count', 'comments_p', 'u_comment','u_comm_exist', 'is_favorit'));
    }


    public function search()
    {
        $term = Input::get('name');
        $author_id = Input::get('author_id');
				$results = array();
				$queries = Book::where('name', 'LIKE', '%'.$term.'%')->where('author_id', $author_id)->orWhere('original_name', 'LIKE', '%'.$term.'%')->where('author_id', $author_id)->get();
        foreach ($queries as $query)
				{
						$results[] = [ 'id' => $query->id, 'name' => $query->name];
        }
        return response()->json($results);
    }



    public function create(){
        $bookCategories = DB::table('book_categories')->orderBy('nazov', 'ASC')->get();
        return view('book.create', compact('bookCategories'));
    }

    public function store(BookStoreRequest $request){
        $book=new Book($request->all());

        $bookCategories = DB::table('book_categories')->orderBy('nazov', 'ASC')->get();

        if($book->cover_img && $book->cover_img->isValid()) {
            $fileName = str_random(40).'.'.$book->cover_img->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU
            $image = Image::make($book->cover_img);
            $image->resize(400, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $image->save(public_path('uploads/books/' .$fileName));
            $book->cover_img = $fileName;
        }
        $author = Author::where('id', $book->author_id)->first();

        $book->user_id = Auth::check() ? Auth::id() : 1;
        $book->slug = str_slug($author->getName().' '.$book->name);
        $book->save();

        foreach($bookCategories as $bookCategory){
           if(!empty(Input::get('bookCategory_'.$bookCategory->id))){
               DB::table('book_join_categories')->insert(['book_id'=>$book->id, 'book_category_id'=>$bookCategory->id]);
           }
        }

        return redirect('kniha/pridat')->with('succeed', 'Kniha bola uložená. Ďakujeme.');
    }


    public function edit($book_id){
        if(!$book=Book::where('id', $book_id)->first()) return back()->with('error', 'Kniha s týmto ID neexistuje.');
        $bookCategories = DB::table('book_categories')->orderBy('nazov', 'ASC')->get();
        $bookCategories_old = DB::table('book_join_categories')->where('book_id', $book->id)->get();
        return view('book.edit', compact('book', 'bookCategories', 'bookCategories_old'));
    }

    public function update(BookUpdateRequest $request, $book_id){
        if(!$book=Book::where('id', $book_id)->first()) return back()->with('error', 'Kniha s týmto ID neexistuje.');
        $bookCategories = DB::table('book_categories')->orderBy('nazov', 'ASC')->get();

        $book->fill($request->all());
          if($request->hasFile('cover_img') && $book->cover_img->isValid()) {
            $fileName = str_random(40).'.'.$book->cover_img->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU
            $image = Image::make($book->cover_img);
            $image->resize(400, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $image->save(public_path('uploads/books/' .$fileName));
            $book->cover_img = $fileName;
        }


        $author = Author::where('id', $book->author_id)->first();
        $book->slug = str_slug($author->getName().' '.$book->name);
        $book->save();

        DB::table('book_join_categories')->where('book_id', $book_id)->delete();
        foreach($bookCategories as $bookCategory){
           if(!empty(Input::get('bookCategory_'.$bookCategory->id))){
               DB::table('book_join_categories')->insert(['book_id'=>$book->id, 'book_category_id'=>$bookCategory->id]);
           }
        }

        return redirect('kniha/'.$book_id.'/upravit')->with('succeed', 'Kniha bola upravená. Ďakujeme.');
    }

    public function delete($book_id){
        if(!$book=Book::where('id', $book_id)->first()) return redirect ('knihy')->with('error', 'Kniha s týmto ID neexistuje.');
        $book->delete();
        return redirect ('knihy')->with('succeed', 'Kniha bola vymazaná.');
    }

    public function setFavorite($book_id){
        if(!$book=Book::where('id', $book_id)->first()) return false;
        if(!Auth::check()) return false;
        if(!$bookFav = DB::table('favorit_book')->where('book_id', $book_id)->where('user_id', Auth::id())->first()){
            $favBooksCount = DB::table('favorit_book')->where('user_id', Auth::id())->count();
            DB::table('favorit_book')->insert([
                                            'book_id'=>$book_id,
                                            'user_id'=>Auth::id(),
                                            'rank' => $favBooksCount+1,
                                            'created_at'=>Date("Y-m-d H:i:s"),
                                            'updated_at'=>Date("Y-m-d H:i:s"),
            ]);
            return 1;
        } else{
             DB::table('favorit_book')->where('book_id', $book_id)->where('user_id', Auth::id())->delete();
             return 2;
        }
    }


    public function setFavBookRank($book_id){
        //prerankovanie ak su tam knihy s nulou
        $user_nul_rank_books = FavoritBook::where('user_id', Auth::id())->where('rank', 0)->get();
        if(count($user_nul_rank_books)>0){
            $user_nul_books = FavoritBook::where('user_id', Auth::id())->where('rank', '<>' , 0)->count();
            foreach($user_nul_rank_books as $user_nul_rank_book){
                $user_nul_rank_book->rank = ++$user_nul_books;
                $user_nul_rank_book->save();
            }
        }

        $what = Input::get('sendCom');
        if($what==='up'){
            $book_Fav_N = FavoritBook::where('user_id', Auth::id())->where('book_id', $book_id)->first();
            $book_Fav_N_rank = $book_Fav_N->rank;
            $book_Fav_N->rank = 0;
            $book_Fav_N->save();

            $book_Fav_S = FavoritBook::where('user_id', Auth::id())->where('rank', $book_Fav_N_rank-1)->first();
                $book_Fav_S->rank++;
                $book_Fav_S->save();

            $book_Fav_N->rank = --$book_Fav_N_rank;
            $book_Fav_N->save();

        }elseif($what==='down'){
            $book_Fav_N = FavoritBook::where('user_id', Auth::id())->where('book_id', $book_id)->first();
            $book_Fav_N_rank = $book_Fav_N->rank;
            $book_Fav_N->rank = 0;
            $book_Fav_N->save();

            $book_Fav_S = FavoritBook::where('user_id', Auth::id())->where('rank', $book_Fav_N_rank+1)->first();
                $book_Fav_S->rank--;
                $book_Fav_S->save();

            $book_Fav_N->rank = ++$book_Fav_N_rank;
            $book_Fav_N->save();
        }else{
            return back()->with('error', 'Niečo sa nepodarilo, poradie obľúbených kníh nebolo zmenené.');
        }
        return back()->with('succeed', 'Poradie obľúbených kníh bolo zmenené.');
    }

}
