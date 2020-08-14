@extends('layouts.app')

@section('content')
<h1><?= (Auth::id()==$user->id) ? 'Tvoji obľúbení autori:' : 'Obľúbení autori: '.$user->getUsername() ?></h1>
@foreach($favAuthors as $favAuthor)
<?php $author = $favAuthor->author; ?>
    <div style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px ">
        @if(Auth::id()==$user->id && count($favAuthors)>1)
            <form action="{{ url('/autor/setFavBookRank/'.$author->id) }}" method='POST'>
                @csrf
                <button style="width:35%" name="sendCom" value="up" <?= ($favAuthor->rank == 1 or count($favAuthors)<2) ? ' disabled' : ''?>><i class="material-icons">keyboard_arrow_up</i></button>
                <button  style="width:35%" name="sendCom" value="down" <?= ($favAuthor->rank == count($favAuthors) or count($favAuthors)<2) ? ' disabled' : ''?>><i class="material-icons">keyboard_arrow_down</i></button>
            </form>
        @endif
        <a href="autor/<?= $author->slug ?>" >
          <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px;"/><br/>
          <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $author->getName() ?></span>
        </a>
     </div>
@endforeach
{{ $favAuthors->links() }}
@if(count($favAuthors)==0)
    <span style="color:red;">Zatiaľ nemáte pridaných žiadnych autorov medzi obľúbených.</span>
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