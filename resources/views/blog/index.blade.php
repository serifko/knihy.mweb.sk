@extends('layouts.app')

@section('title', 'blog')
@section('content')

<h1><?= $headtitle ?></h1>
@foreach($blogs as $blog)
<h2>{{ $blog->title }}</h2>
    @if($blog->link_type==1 or $blog->link_type==2)
    <div class="row">
        <div class="col-2" style="text-align: center">
            <span style="font-weight: bold">Napísal:</span><br/>
            {{ $blog->user->getUsername() }}
        </div>
        <div class="col-8">
            {!! $blog->text !!}
            @if(strlen($blog->text)<250)
               {!! strip_tags($blog->text) !!}
            @else
            {!! str_limit(strip_tags($blog->text), 250) !!}...<br/><a href="{{ url('blog/'.$blog->slug) }}" title="zobraziť celý článok">zobraziť viac</a>
            @endif
        </div>
        <div class="col-2" style="text-align: center">
            @if($blog->link_type==1)
                <span style="font-weight: bold">O knihe:</span><br/>
                <?php $book=$blog->getLink(); ?>
                <div style="text-align:center; display: inline-block; vertical-align:top; width:170px; line-height: 100%">
                <a href="{{ url('kniha/'.$book->slug) }}" style=''>
                  <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 60px; padding-bottom: 5px"/><br/>
                  <span style="margin-bottom:0px;padding-bottom:0px; font-size: small" class='align-text-bottom'><?= $book->name ?></span></a><br/>
                </div>     
            @else
                <span style="font-weight: bold">O autorovi:</span><br/>
                <?php $author=$blog->getLink(); ?>
                <div style="text-align:center; display: inline-block; vertical-align:top; width:170px; line-height: 100%">
                <a href="{{ url('autor/'.$author->slug) }}" style=''>
                  <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" class="img-fluid rounded align-middle" style="width: 60px; padding-bottom: 5px"/><br/>
                  <span style="margin-bottom:0px;padding-bottom:0px; font-size: small" class='align-text-bottom'><?= $author->getName() ?></span></a><br/>
                </div>  
            @endif   
        </div>
    </div>
    @else
        <div class="row">
        <div class="col-2" style="text-align: center">
            <span style="font-weight: bold">Napísal:</span><br/>
            {!! $blog->user->name !!}
        </div>
        <div class="col-10">
            @if(strlen($blog->text)<350)
                {!! strip_tags($blog->text) !!}
            @else
            {!! str_limit(strip_tags($blog->text), 350) !!}...<br/><a href="{{ url('blog/'.$blog->slug) }}" title="zobraziť celý článok">zobraziť viac</a>
            @endif
        </div>
    </div>
    @endif
<hr/>
@endforeach
{{ $blogs->links() }}
@if($blogs->count()==0)
    <span>Zatiaľ nemáme žiadny príspevok v blogíku.</span>
@endif

@endsection
