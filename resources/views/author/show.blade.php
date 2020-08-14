@extends('layouts.app')

@section('title', $author->getName())

@section('content')
<h1><?= $author->getName() ?> </h1>
<div class="row">
    <div class="col-3">
        <div style="margin: 0px 15px 15px 0px; text-align: center" >
            <img src="/uploads/authors/<?= $author->photo ?? 'no_author.jpg' ?>" class="img-fluid rounded align-middle" />

            @if(Auth::check() && Auth::user()->role>2)
                <a href="{{ url('autor/'.$author->id.'/upravit') }}" class="btn btn-outline-secondary btn-sm btn-block" role="button" aria-pressed="true"> upraviť </a>
                <a href="{{ url('autor/'.$author->id.'/vymazat') }}" class="btn btn-sm btn-block btn-danger" role="button" aria-pressed="true" onclick="if (! confirm('Skutočne schcete vymazať tohto autora?')) { return false; }"> vymazať </a>
            @endif
            @if($quotes_num>0)
                <a href="{{ url('/citaty/autor/'.$author->slug) }}"> citáty({{$quotes_num}})</a>
            @endif
        </div>
    </div>
    <div class="col-6">
        <table>
            @if(!empty($author->getFullName()))
            <tr>
                <td><span class="">Celým menom: </span></td>
                <td><?= $author->getFullName() ?></td>
            </tr>
            @endif
            @if(!empty($author->real_name))
            <tr>
                <td><span class="">Vlastným menom: </span></td> 
                <td><?= $author->real_name ?></td>
            </tr>
            @endif
             @if(!empty($author->nation_id))
            <tr>
                <td><span class="">Národnosť: </span></td>
                <td> 
                    <img src='/uploads/nations/<?= $author->nation()->flag_nation ?>' style="max-height: 25px"/>
                    <span class='align-middle centered '><?= $author->nation()->name_nation ?></span>
                </td>
            </tr>
            @endif
            @if(!empty($author->birth_date))
            <tr>
                <td style='vertical-align: top'><span class="">Narodený: </span></td>
                <td>
                <?= date("d.m.Y", strtotime($author->birth_date)) ?><?= empty($author->death_date) ? ', '.$author->getAge() : '' ?> 
                @if(!empty($author->birth_place))
                <?= '<br/>'.$author->birth_place ?> 
                @endif
                </td>
            </tr>
            @endif
            @if(!empty($author->death_date))
            <tr>
                <td style='vertical-align: top'><span class="">Zomrel: </span></td>
                <td>
                <?= date("d.m.Y", strtotime($author->death_date)) ?><?= !empty($author->death_date) ? ', '.$author->getAge() : '' ?> 
                @if(!empty($author->death_place))
                <?= '<br/>'.$author->death_place ?> 
                @endif
                </td>
            </tr>
            @endif
            @if(!empty($author->user_id) && $author->user_id != 1)
            <tr>
                <td><span class="">Vložil: </span></td>
                <td>
                        {{ $author->user()->name }}
                </td>
            </tr>
            @endif
        </table>
    </div>
    <div class="col-3">
        @if(Auth::check())
        <div title="Obľúbený autor" class="rounded align-middle" style="font-size:16px; text-align: center; vertical-align:top" >
            <a href="" id="set_favorit">
                @if($is_favorit==0)
                    <i class="material-icons md-36" id="favorit_maticon" style="font-size:18px;">add_circle</i>
                    <span style="font-size:1em" id="add_favorit_label">pridať medzi obľúbených</span>                                                           
                @else
                    <i class="material-icons md-36" id="favorit_maticon" style="font-size:18px;">remove_circle_outline</i>
                    <span style="font-size:1em" id="add_favorit_label">odstrániť z obľúbených</span>      
                @endif
            </a>
        </div>
        @endif
    </div>

</div>

@if(!empty($author->info))
    <div class="row">
        <div class="col-12">
            <h2>O autorovi:</h2>
            <div style="text-align: justify;">
                <?= nl2br($author->info) ?>
            </div>
        </div>     
    </div>   
@endif
<hr/>
<br/>
@if($author->books()->count()>0)
    <div class="row">
        <div class="col-12">
            <h3>Knihy:</h3>
                @foreach($author->books as $book)
                    <div style="text-align:center; display: inline-block; vertical-align:top; width:165px; padding:5px; margin-right: 15px; height: 250px; line-height: 100%; margin-bottom: 25px">
                       <a href="{{ url('kniha/'.$book->slug) }}" style=''>
                         <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
                         <span style="margin-bottom:0px;padding-bottom:0px;" class='align-text-bottom'><?= $book->name ?></span></a><br/>
                    </div>  
                @endforeach
        </div>
    </div>
@endif



<script>
    $(document).ready(function(){
        $("#set_favorit").click(function(){
            $.ajax({
                url: "/autor/pridatoblubenu/<?= $author->id ?>",
                type: "get",
                success: function(result){
                    if (result==2){
                        msg="pridať medzi obľúbené";
                        fav_icon="add_circle";
                    } else {
                        msg="odstrániť z obľúbených";
                        fav_icon="remove_circle_outline";
                    }
                    $("#add_favorit_label").text(msg);
                    $("#favorit_maticon").text(fav_icon);
                  }
              });
              return false;
          });
      });
    </script>
    



@endsection


@section('page_menu')
    @include('author.page_menu')
@endsection
