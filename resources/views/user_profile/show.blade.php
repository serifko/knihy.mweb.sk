@extends('layouts.app')

@section('title', $name)
@section('content')
<div class="row">
    <div class="col-3">
        <?php
            if(!empty($userProfile->photo) && (($userProfile->photo_pub==2 or ($userProfile->photo_pub==1 && $isFriend==true)) or $seeAll==true)){
                $photo = $userProfile->photo;
            } else {
                $photo = 'silueta.png';
            }
        ?>
        <img src="/uploads/profiles/<?= $photo ?>" class="img-fluid rounded-circle align-middle" style="margin: 0% 5% 5% 0%; "/>    
    </div>
    <div class="col-9">
        <h1>{{ $name }}</h1>
        @if(!empty($userProfile->realname) && (($userProfile->realname_pub==2 or ($userProfile->realname_pub==1 && $isFriend==true)) or $seeAll==true))
            <div class="row">
                <div class="col-3">
                    <span>Meno: </span>
                    
                </div>
                <div class="col-7">
                    {{ $userProfile->realname }}
                </div>
            </div>        
        @endif
         @if(($userProfile->email_pub==2 or ($userProfile->email_pub==1 && $isFriend==true)) or $seeAll==true)
            <div class="row">
                <div class="col-3">
                    <span>E-mail: </span>
                </div>
                <div class="col-7">
                    {{ $email }}
                </div>
            </div>        
        @endif
        @if(!empty($userProfile->birthday) && (($userProfile->birthday_pub==2 or ($userProfile->birthday_pub==1 && $isFriend==true)) or $seeAll==true))
            <div class="row">
                <div class="col-3">
                    <span>Dátum narodenia: </span>
                </div>
                <div class="col-7">
                    {{ date("d.m.Y", strtotime($userProfile->birthday)) }}
                </div>
            </div>        
        @endif
        @if(!empty($userProfile->birthday) && (($userProfile->age_pub==2 or ($userProfile->age_pub==1 && $isFriend==true)) or $seeAll==true))
            <div class="row">
                <div class="col-3">
                    <span>Vek: </span>
                </div>
                <div class="col-7">
                    {{ $userProfile->getAge() }} rokov
                </div>
            </div>        
        @endif
            <div class="row" style="margin-top:20px">
                <div class="col-12">
                    <span style="font-size: 16px; font-weight: bold;">Kde ma nájdete? </span>
                </div>
            </div>        
            <div class="row" style="margin-top:5px">
                @if(!empty($userProfile->website) && (($userProfile->website_pub==2 or ($userProfile->website_pub==1 && $isFriend==true)) or $seeAll==true))
                    <div class="col-1">
                        <a href="{{ $userProfile->website }}" title="moja webstránka" target="_blank"><img src="{{ asset('./public/images/web.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť moju webstránku"></a>
                    </div>
                @endif
                @if(!empty($userProfile->facebook) && (($userProfile->facebook_pub==2 or ($userProfile->facebook_pub==1 && $isFriend==true)) or $seeAll==true))
                    <div class="col-1">
                        <a href="https://facebook.com/{{ $userProfile->facebook }}" title="môj facebook" target="_blank"><img src="{{ asset('./public/images/facebook.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť môj facebook"></a>
                    </div>
                @endif
                
                @if(!empty($userProfile->twitter) && (($userProfile->twitter_pub==2 or ($userProfile->twitter_pub==1 && $isFriend==true)) or $seeAll==true))
                    <div class="col-1">
                        <a href="https://twitter.com/{{ $userProfile->twitter }}" title="môj twitter" target="_blank"><img src="{{ asset('./public/images/twitter.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť môj twitter"></a>
                    </div>
                @endif
                
                @if(!empty($userProfile->instagram) && (($userProfile->instagram_pub==2 or ($userProfile->instagram_pub==1 && $isFriend==true)) or $seeAll==true))
                    <div class="col-1">
                        <a href="https://instagram.com/{{ $userProfile->instagram }}" title="môj instagram" target="_blank"><img src="{{ asset('./public/images/instagram.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť môj instagram"></a>
                    </div>
                @endif
                
                @if(!empty($userProfile->tumblr) && (($userProfile->tumblr_pub==2 or ($userProfile->tumblr_pub==1 && $isFriend==true)) or $seeAll==true))
                    <div class="col-1">
                        <a href="https://tumblr.com/{{ $userProfile->tumblr }}" title="môj tumblr" target="_blank"><img src="{{ asset('./public/images/tumblr.png') }}" style="max-width: 30px; max-height: 30px;" alt="zobraziť môj tumblr"></a>
                    </div>
                @endif
            </div>
    </div>
</div>

@if(!empty($userProfile->about) && (($userProfile->about_pub==2 or ($userProfile->about_pub==1 && $isFriend==true)) or $seeAll==true))
    <div class="row" style="margin-top:20px">
        <div class="col-12">
            <h3>O mne:</h3>
            {{ $userProfile->about }}
        </div>
    </div>     
@endif
@if(count($favBooks)>0)
    <hr/>
    <h3>Obľúbené knihy:</h3>
    @foreach($favBooks as $favBook)
    <?php $book = $favBook->book ?>
        <div style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px; line-height: 100%; margin-bottom: 25px">
            <a href="{{ url('kniha/'.$book->slug) }}" style=''>
              <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
              <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
              <small><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small>
        </div>
    @endforeach
@endif
@if(count($favBooks)>0)
    <hr/>
    <h3>Obľúbení autori:</h3>
        @foreach($favAuthors as $favAuthor)
        <?php $author = $favAuthor->author; ?>
            <div style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px ">
                <a href="autor/<?= $author->slug ?>" >
                  <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px;"/><br/>
                  <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $author->getName() ?></span>
                </a>
             </div>
        @endforeach
@endif
@endsection


@section('page_menu')
   @if($userProfile->user_id!=Auth::id())
   <div class="btn-group-vertical btn-group-sm" style='width: 100%; background-color: #2e6da4'>
      @if($isFriend==1)
        <button type="button" class="btn btn-secondary">SPRÁVY</button>
      @endif
      <div class="btn-group btn-group-sm" role="group">
        <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          PRIATEĽSTVO
        </button>
        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
          @if($isFriend==1)
          <a class="dropdown-item" href="{{ url('/priatelstvo/zrusit/'.$userProfile->user->id) }}" onclick="if (! confirm('Skutočne schcete zrušiť priateľstvo s užívateľom {{ $userProfile->user->getUsername() }}?')) { return false; }">Zrušiť priateľstvo</a>
          @else 
            <a class="dropdown-item" href="{{ url('/priatelstvo/ziadost/'.$userProfile->user_id) }}">Poslať žiadosť</a>
          @endif
          <a class="dropdown-item" href="{{ url('/blokovat/ziadost/'.$userProfile->user_id) }}" onclick="if (! confirm('Skutočne schcete zablokovať užívateľa {{ $userProfile->user->getUsername() }}?')) { return false; }">Zablokovať</a>
        </div>
      </div>
    </div>
@endif

    @php
        if($userProfile->user_id!=Auth::id()){
            $pllink = '/'.$userProfile->user->name;
        }else{
            $pllink = '/';
        }
    
    @endphp
    <div class="r_vert_menu">
        <ul>
         @if($userProfile->user_id!=Auth::id())
            <li><a class="dropdown-item" href="{{ url('profil'.$pllink) }}">profil</a></li>
         @else
            <li><a class="dropdown-item" href="{{ url('mojecitanie'.$pllink) }}">moje čítanie</a></li>
         @endif
         <li><a class="dropdown-item" href="{{ url('oblubeneknihy'.$pllink) }}">obľúbené knihy</a></li>
         <li><a class="dropdown-item" href="{{ url('oblubeniautori'.$pllink) }}">obľúbení autori</a></li>
       </ul>
    </div>


@endsection