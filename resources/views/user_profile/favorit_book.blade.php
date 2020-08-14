@extends('layouts.app')

@section('content')
<h1><?= (Auth::id()==$user->id) ? 'Tvoje obľúbené knihy:' : 'Obľúbené knihy: '.$user->getUsername() ?></h1>
@foreach($favBooks as $favBook)
<?php $book = $favBook->book ?>
    <div style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px; line-height: 100%; margin-bottom: 25px">
        @if(Auth::id()==$user->id && count($favBooks)>1)
            <form action="{{ url('knihy/setFavBookRank/'.$book->id) }}" method='POST'>
                @csrf
                <button style="width:35%" name="sendCom" value="up" <?= ($favBook->rank == 1 or count($favBooks)<2) ? ' disabled' : ''?>><i class="material-icons">keyboard_arrow_up</i></button>
                <button  style="width:35%" name="sendCom" value="down" <?= ($favBook->rank == count($favBooks) or count($favBooks)<2) ? ' disabled' : ''?>><i class="material-icons">keyboard_arrow_down</i></button>
            </form>
        @endif
        <a href="{{ url('kniha/'.$book->slug) }}" style=''>
          <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
          <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
          <small><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small>
    </div>
@endforeach
{{ $favBooks->links() }}
@if(count($favBooks)==0)
    <span style="color:red;">Zatiaľ nemáte pridané žiadne knihy medzi obľúbené.</span>
@endif
@endsection



@section('page_menu')
    @php
        if($user->id!=Auth::id()){
            $pllink = '/'.$user->name;
        }else{
            $pllink = '/';
        }
    
    @endphp
    <div class="r_vert_menu">
        <ul>
         @if($user->id!=Auth::id())
            <li><a class="dropdown-item" href="{{ url('profil'.$pllink) }}">profil</a></li>
         @else
            <li><a class="dropdown-item" href="{{ url('mojecitanie'.$pllink) }}">moje čítanie</a></li>
         @endif
         <li><a class="dropdown-item" href="{{ url('oblubeneknihy'.$pllink) }}">obľúbené knihy</a></li>
         <li><a class="dropdown-item" href="{{ url('oblubeniautori'.$pllink) }}">obľúbení autori</a></li>
       </ul>
    </div>
@endsection