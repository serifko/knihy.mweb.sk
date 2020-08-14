<?php

namespace App\Http\Controllers;

use App\Author;
use Illuminate\Http\Request;
use App\Http\Requests\AuthorStoreRequest;
use App\Http\Requests\AuthorUpdateRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Input;
use App\Quote;
use App\FavoritAuthor;

class AuthorController extends Controller
{

    public function index(){
        $authors = Author::orderBy('created_at', 'DESC')->paginate(20);
        return view('author.index', compact('authors'));
    }

    public function show($author_slug){
        if(!$author = Author::where('slug', $author_slug)->first()) return redirect('autori')->with('error', 'Autor sa v databáze nenachádza.');
        $quotes_num = Quote::where('author_id', $author->id)->count();

        $is_favorit = Auth::check() ? DB::table('favorit_author')->where('author_id', $author->id)->where('user_id', Auth::id())->count() : null;
        return view('author.show', compact('author', 'quotes_num', 'is_favorit'));
    }


    public function search()
    {
        $term = Input::get('name');
	$results = array();
	$queries = Author::where('first_name', 'LIKE', '%'.$term.'%')->orWhere('last_name', 'LIKE', '%'.$term.'%')->orWhere('real_name', 'LIKE', '%'.$term.'%')->get();
        foreach ($queries as $query)
	{
	    $results[] = [ 'id' => $query->id, 'name' => $query->getName()];
        }
        return response()->json($results);
    }



    public function create(){
        $nations = DB::table('nations')->orderBy('name_nation', 'ASC')->get();
        return view('author.create', compact('nations'));
    }
    public function store(AuthorStoreRequest $request){
        $author=new Author($request->all());

        if($author->photo && $author->photo->isValid()) {
                $fileName = str_random(40).'.'.$author->photo->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU
                $image = Image::make($author->photo);
                $image->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $image->save(public_path('uploads/authors/' .$fileName));
                $author->photo = $fileName;
        }

        $author->user_id = Auth::check() ? Auth::id() : 1;
        $author->slug = str_slug($author->getName());
        $author->save();

        return redirect('autor/pridat')->with('succeed', 'Autor bol uložený. Ďakujeme.');
    }


    public function edit($author_id){
        $nations = DB::table('nations')->orderBy('name_nation', 'ASC')->get();
        if (!$author = Author::where('id', $author_id)->first()) return redirect ('autori')->with('error', 'Autor neexistuje.');
        return view('author.edit', compact('nations', 'author'));
    }
    public function update(AuthorUpdateRequest $request, $author_id){
        $author = Author::where('id', $author_id)->first();
        $author->fill($request->all());

        if($request->hasFile('photo') && $author->photo->isValid()) {
                $fileName = str_random(40).'.'.$author->photo->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU
                $image = Image::make($author->photo);
                $image->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $image->save(public_path('uploads/authors/' .$fileName));
                $author->photo = $fileName;
        }
        $author->slug = str_slug($author->getName());
        $author->save();
        return redirect('autor/'.$author_id.'/upravit')->with('succeed', 'Autor bol upravený. Ďakujeme.');
    }


    public function delete($author_id){
        if(!$author = Author::where('id', $author_id)->first()) return redirect ('autori')->with('error', 'Autor neexistuje.');
        $author->delete();
        return redirect ('autori')->with('succeed', 'Autor bol vymazaný.');
    }



    public function setFavorite($author_id){
        if(!$author=Author::where('id', $author_id)->first()) return false;
        if(!Auth::check()) return false;
        if(!$authorFav = DB::table('favorit_author')->where('author_id', $author_id)->where('user_id', Auth::id())->first()){
            $favAuthorsCount = DB::table('favorit_author')->where('user_id', Auth::id())->count();
            DB::table('favorit_author')->insert([
                                            'author_id'=>$author_id,
                                            'user_id'=>Auth::id(),
                                            'rank'=>$favAuthorsCount++,
                                            'created_at'=>Date("Y-m-d H:i:s"),
                                            'updated_at'=>Date("Y-m-d H:i:s"),
            ]);
            return 1;
        } else{
            DB::table('favorit_author')->where('author_id', $author_id)->where('user_id', Auth::id())->delete();
            return 2;
        }
    }


    public function setFavAuthorRank($author_id){
        //prerankovanie ak su tam knihy s nulou
        $user_nul_rank_authors = FavoritAuthor::where('user_id', Auth::id())->where('rank', 0)->get();
        if(count($user_nul_rank_authors)>0){
            $user_nul_authors = FavoritAuthor::where('user_id', Auth::id())->where('rank', '<>' , 0)->count();
            foreach($user_nul_rank_authors as $user_nul_rank_author){
                $user_nul_rank_author->rank = ++$user_nul_authors;
                $user_nul_rank_author->save();
            }
        }
        if(!empty(Input::get('sendCom'))){
            $what = Input::get('sendCom');
            if($what==='up'){
                $author_Fav_N = FavoritAuthor::where('user_id', Auth::id())->where('author_id', $author_id)->first();
                $author_Fav_N_rank = $author_Fav_N->rank;
                $author_Fav_N->rank = 0;
                $author_Fav_N->save();

                $author_Fav_S = FavoritAuthor::where('user_id', Auth::id())->where('rank', $author_Fav_N_rank-1)->first();
                    $author_Fav_S->rank++;
                    $author_Fav_S->save();

                $author_Fav_N->rank = --$author_Fav_N_rank;
                $author_Fav_N->save();

            }elseif($what==='down'){
                $author_Fav_N = FavoritAuthor::where('user_id', Auth::id())->where('author_id', $author_id)->first();
                $author_Fav_N_rank = $author_Fav_N->rank;
                $author_Fav_N->rank = 0;
                $author_Fav_N->save();

                $author_Fav_S = FavoritAuthor::where('user_id', Auth::id())->where('rank', $author_Fav_N_rank+1)->first();
                    $author_Fav_S->rank--;
                    $author_Fav_S->save();

                $author_Fav_N->rank = ++$author_Fav_N_rank;
                $author_Fav_N->save();
            }else{
                return back()->with('error', 'Niečo sa nepodarilo, poradie obľúbených kníh nebolo zmenené.');
            }
            return back()->with('succeed', 'Poradie obľúbených kníh bolo zmenené.');
        } else{
            return redirect('')->with('error', 'Niečo sa nepodarilo, poradie obľúbených kníh nebolo zmenené.');
        }

    }

}
