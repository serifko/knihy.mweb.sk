@extends('layouts.app')
@section('title', 'autori')
@section('content')
<h1>Autori: </h1>
    @foreach($authors as $author)
    <div class="grow-sm" style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px ">
        <a href="autor/<?= $author->slug ?>" >
          <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px;"/><br/>
          <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'>{{ $author->getName() }}</span>
        </a>
     </div>
    @endforeach
    <div class="text-center">
        <?= $authors->links() ?>
    </div>
@endsection


@section('page_menu')
    @include('author.page_menu')
@endsection
