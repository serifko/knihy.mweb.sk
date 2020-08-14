@extends('layouts.app')
@section('title', 'knihy')
@section('content')
<h1>Knihy</h1>
    @foreach($books as $book)
    <div class="grow-sm" style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px; line-height: 100%; margin-bottom: 25px">
        <a href="{{ url('kniha/'.$book->slug) }}" style=''>
          <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
          <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
          <small><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small>
     </div>
    @endforeach
    <div class="text-center">
        <?= $books->links() ?>
    </div>
@endsection


@section('page_menu')
    @include('book.page_menu')
@endsection
