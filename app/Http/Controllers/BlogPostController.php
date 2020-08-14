<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;
use App\Book;
use App\Author;
use App\Http\Requests\BlogPostStoreRequest;
use App\Http\Requests\BlogPostUpdateRequest;
use App\BlogPost;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use App\User;
use Illuminate\Support\Facades\Session;

class BlogPostController extends Controller
{
    
    public function index($type="", $string=""){
        
        if($type=="uzivatel"){
            if(!$user_id = DB::table('users')->select('id')->where('name', $string)->first())
            {
                return redirect('blog')->with('Užívateľ neexistuje.');
            }
            $blogs = BlogPost::where('user_id', $user_id)->where('is_publised', 1)->orWhere('user_id', $user_id)->where('publish_date', '<', Date("Y-m-d H:i:s"))->orderBy('created_at', 'DESC')->paginate(3);
            $headtitle = 'Blog : ';
        }else{
           $blogs = BlogPost::where('is_publised', 1)->orWhere('publish_date', '<', Date("Y-m-d H:i:s"))->orderBy('created_at', 'DESC')->paginate(3);
           $headtitle  = 'Blog: ';
        }
        
        return view('blog.index', compact('blogs', 'headtitle'));
    }
    
    
    public function zoznam(){
        $blogs = BlogPost::orderBy('created_at', 'DESC')->paginate(30);
        return view('blog.list', compact('blogs'));
    }
    
    
    public function show(Request $request, $blog_slug){
        if(!$blog = BlogPost::where('slug', $blog_slug)->where('is_publised', 1)->orWhere('slug', $blog_slug)->where('publish_date', '>', Date("Y-m-d H:i:s"))->first()) return redirect ('blog')->with('error', 'Takýto príspevok sa na webe nenachádza.'); 
            if(empty(session('blogView_'.$blog->id))){
                $blog->num_visitors++;
                $blog->save();
                cookie($name = 'blogView_'.$blog->id, $value = true, 60*24*30);
                session(['blogView_'.$blog->id => TRUE]);
            }
        $username=DB::table('users')->where('id', $blog->user_id)->pluck('name');
        return view('blog.show', compact('blog', 'username'));
    }
    
    
    public function create(){
        return view('blog.create');
    }
    
    public function store(BlogPostStoreRequest $request){
        $blogPost = new BlogPost($request->all());
       //$blogPost->title_image ="";
        if($blogPost->title_image && $blogPost->title_image->isValid()) {
                $fileName = str_random(40).'.'.$blogPost->title_image->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU        
                $image = Image::make($blogPost->title_image);
                $image->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $image->save(public_path('uploads/blog/' .$fileName));
                $blogPost->title_image = $fileName;                
        }
        
    if(empty($blogPost->link_id)){
        $blogPost->link_type=NULL;
    }
        
        $blogPost->user_id = Auth::check() ? Auth::id() : 1;
        $blogPost->slug = str_slug(Date("Ymd").'-'.$blogPost->title);
        $blogPost->save();
        
        return redirect('blog/'.$blogPost->id.'/upravit')->with('succeed', 'Príspevok bol uložený. Ďakujeme.');      
    }

    public function edit($blog_post_id){
        if(!$blogPost = BlogPost::find($blog_post_id)){
            return back()->with('error', 'Príspevok s týmto ID neexistuje.');
        }
        if($blogPost->user_id!=Auth::id() and Auth::user()->role<=2){
            return back()->with('error', 'Nemáte právo upravovať tento príspevok.');
        }
        return view('blog.edit', compact('blogPost'));
    }
    public function update(BlogPostStoreRequest $request, $blog_post_id){
        if(!$blogPost = BlogPost::find($blog_post_id)){
            return back()->with('error', 'Príspevok s týmto ID neexistuje.');
        }
        if($blogPost->user_id!=Auth::id() and Auth::user()->role<=2){
            return back()->with('error', 'Nemáte právo upravovať tento príspevok.');
        }
        $blogPost->fill($request->all());

        if($request->hasFile('title_image') && $blogPost->photo->isValid()) {
                $fileName = str_random(40).'.'.$blogPost->title_image->getClientOriginalExtension(); // MENO + KONCOVKA OBRAZKU        
                $image = Image::make($blogPost->title_image);
                $image->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $image->save(public_path('uploads/blog/' .$fileName));
                $blogPost->title_image = $fileName;                
        }
        $blogPost->is_publised = empty($blogPost->is_publised) ? 0 : 1;
        $blogPost->user_id = Auth::check() ? Auth::id() : 1;
        $blogPost->slug = str_slug(Date("Ymd").'-'.$blogPost->title);
        $blogPost->save();
        
        return redirect('blog/'.$blogPost->id.'/upravit')->with('succeed', 'Príspevok bol upravený. Ďakujeme.');      
    }


    public function getLinkBlogPost()
    {
        $term = Input::get('name');
        $link_type = Input::get('link_type');
        $results = array();
        
        if($link_type==1){
            $queries = Book::where('name', 'LIKE', '%'.$term.'%')->orWhere('original_name', 'LIKE', '%'.$term.'%')->get();
            foreach ($queries as $query)
            {
                $results[] = [ 'id' => $query->id, 'name' => $query->name.' - '.$query->author->getName()];
            }       
        }elseif($link_type==2){
            $queries = Author::where('first_name', 'LIKE', '%'.$term.'%')->orWhere('last_name', 'LIKE', '%'.$term.'%')->orWhere('real_name', 'LIKE', '%'.$term.'%')->get();
            foreach ($queries as $query)
            {
                $results[] = [ 'id' => $query->id, 'name' => $query->getName()];
            } 
        }else{
            $results[]='link_type='.$link_type.', name='.$term;
        }
        return response()->json($results);
    }
    
    public function delete($blog_post_id){
        if(!$blogPost = BlogPost::find($blog_post_id)) return redirect ('blog')->with('error', 'Príspevok neexistuje.');
        $blogPost->delete();
        return redirect ('blog')->with('succeed', 'Príspevok bol vymazaný.');
    }
    
    
}
