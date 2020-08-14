<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\FavoritBook;
use App\FavoritAuthor;
use App\UserProfile;
use App\User;
use App\Http\Requests\UserProfileStoreRequest;
use Intervention\Image\ImageManagerStatic as Image;
use App\Relation;

class UserProfileController extends Controller
{
    
    public function favoritBooks($user_name=""){
        if(empty($user_name)){
            $user = Auth::user();
        } else{
            if(!$user = User::select('id', 'name')->where('name', $user_name)->first()) return redirect('/')->with('error', 'Užívateľ neexistuje.');

        }
        $favBooks = FavoritBook::where('favorit_book.user_id', $user->id)->orderBy('rank', 'ASC')->paginate(15);
        return view('user_profile.favorit_book', compact('favBooks', 'user'));
        
    }
    
    public function favoritAuthors($user_name=""){
        if(empty($user_name)){
            $user = Auth::user();
        } else{
            if(!$user = User::select('id', 'name')->where('name', $user_name)->first()) return redirect('/')->with('error', 'Užívateľ neexistuje.');

        }
        $favAuthors = FavoritAuthor::where('favorit_author.user_id', $user->id)->orderBY('rank', 'ASC')->paginate(15);
        return view('user_profile.favorit_author', compact('favAuthors', 'user'));       
    }
    
    
     
    public function show($username=""){
        $existRel=0;
        $isFriend = 0;
        $seeAll=0;
        
        
        if(empty($username)){
            $user_id = Auth::id();
            $seeAll=1;
        } else{
            if(!$user=DB::table('users')->select('id')->where('name', $username)->first()) return redirect('')->with('error', 'Takýto užívateľ na stránke neexistuje.');
            $user_id = $user->id;

            if($relation = Relation::where('user_id_f', Auth::id())->where('user_id_s', $user_id)
                                ->orWhere('user_id_f', $user_id)->where('user_id_s', Auth::id())->first()){
                if($relation->blocked==1 && $relation->blocked_by!=Auth::id()){
                    return redirect('blokovanie')->with('error', 'Tento užívateľ Vás zablokoval a nemôžete si prezerať jeho profil ani ho kontaktovať.');
                }
                $existRel=1;
                $isFriend=$relation->status;
            }   
        }
        
        $name=DB::table('users')->where('id', $user_id)->pluck('name')[0];
        $email=DB::table('users')->where('id', $user_id)->pluck('email')[0];
        $favBooks = FavoritBook::where('user_id', $user_id)->orderBy('rank','ASC')->limit(5)->get();
        $favAuthors = FavoritAuthor::where('user_id', $user_id)->orderBy('rank','ASC')->limit(5)->get();
        
        $userProfile = UserProfile::where('user_id', $user_id)->first();
      
        return view('user_profile.show', compact('userProfile', 'name','email', 'favBooks', 'favAuthors', 'isFriend', 'existRel', 'seeAll'));
    }
    
    
    public function setting(){
        $user = User::select('name', 'email')->where('id', Auth::id())->first();
        $userProfile = UserProfile::where('user_id', Auth::id())->first();
        return view('user_profile.setting', compact('user', 'userProfile'));
    }
    public function settingSave(UserProfileStoreRequest $request){
        $userProfile = UserProfile::where('user_id', Auth::id())->first();
        $userProfile->fill($request->all());
        
        if($request->hasFile('photo') && $userProfile->photo->isValid()) {
                $fileName = str_random(40).'.'.$userProfile->photo->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU        
                $image = Image::make($userProfile->photo);
                $image->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $image->save(public_path('uploads/profiles/' .$fileName));
                $userProfile->photo = $fileName;                
        }
        $userProfile->save();
        return redirect('/profil/nastavenie')->with('succeed', 'Nastavenie profilu bolo uložené.');  
        
        
        
        
        
    }
    
    
}
