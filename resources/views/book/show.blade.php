@extends('layouts.app')

@section('title', $book->name.' - '.$book->author->getName())

@section('content')
<div itemscope itemtype="http://schema.org/Book">
  <h1><span itemprop="name"><?= $book->name ?></span></h1>
  <div class="row">
      <div class="col-3">
          <div style="margin: 0px 15px 15px 0px; text-align: center" >
              <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle"/>
              @if(Auth::check())
              <a href="{{ url('kniha/'.$book->id.'/upravit') }}" class="btn btn-outline-secondary btn-sm btn-block" role="button" aria-pressed="true"> upraviť </a>
                  @if(empty($bookstatus) or $bookstatus==false)
                      <a href="{{ url('knihastatus/'.$book->id) }}" class="btn btn-outline-info btn-sm btn-block" role="button" aria-pressed="true"> čítam </a>
                      @if($book_status_count>0)
                      <small>Čítal si už {{$book_status_count}}-krát.</small>
                      @endif
                  @else
                      <a href="{{ url('knihastatus/'.$book->id) }}" class="btn btn-outline-warning btn-sm btn-block" role="button" aria-pressed="true"> dočítam som </a>
                  @endif
              @endif
          </div>
      </div>
      <div class="col-6">
          <table>
              <tr itemprop="author" itemscope itemtype="http://schema.org/Person">
                  <td><span class="">Autor: </span></td>
                <td><a href="{{ url('autor/'.$book->author->slug) }}"><span itemprop="name"><?= $book->author->getName(); ?></span></a></td>
              </tr>
              @if(!empty($book->original_name))
              <tr>
                  <td><span class="">Originálny názov: </span></td>
                  <td><?= $book->original_name ?></td>
              </tr>
              @endif
               @if(!empty($book->publish_year))
              <tr>
                  <td><span class="">Rok vydania: </span></td>
                  <td><?= $book->publish_year ?></td>
              </tr>
              @endif
              @if($book->categories()->count()>0)
              <tr>
                  <td><span class="">Kategórie: </span></td>
                  <td>
                      <?php 
                      $i=0; 
                      foreach($book->categories() as $bookCategory){
                          echo $bookCategory->nazov;
                          $i++;
                          echo ($book->categories()->count()!=$i) ? ', ' : '';
                      }
                      ?>
                  </td>
              </tr>
              @endif
              @if(!empty($book->user_id) && $book->user_id != 1)
              <tr>
                  <td><span class="">Vložil: </span></td>
                  <td>
                          {{ $book->user()->name }}
                  </td>
              </tr>
              @endif
          </table>
      </div>
      <div class="col-3">
          <div title="Priemerné hodnotenie knihy" class="rounded align-middle" style="background-color:#3399ff; color:white; font-weight: bold; font-size:32px; text-align: center;  vertical-align:middle" >
              <i class="material-icons md-36" style="font-size:28px;">star</i> {{ number_format(round($book->rating(), 1), 1) }}
          </div>
          @if(Auth::check())
          <div title="Obľúbené knihy" class="rounded align-middle" style="font-size:16px; text-align: center; vertical-align:top" >
              <a href="" id="set_favorit">
                  @if($is_favorit==0)
                      <i class="material-icons md-36" id="favorit_maticon" style="font-size:18px;">add_circle</i>
                      <span style="font-size:1em" id="add_favorit_label">pridať medzi obľúbené</span>                                                           
                  @else
                      <i class="material-icons md-36" id="favorit_maticon" style="font-size:18px;">remove_circle_outline</i>
                      <span style="font-size:1em" id="add_favorit_label">odstrániť z obľúbených</span>      
                  @endif
              </a>
          </div>
          @endif
      </div>
  </div>
  <div class="row">
      <div class="col-12">
          @if(!empty($book->about))
              <h2>O knihe:</h2>
              <div style="text-align: justify;">
                  <?= nl2br($book->about) ?>
              </div>
          @endif
      </div>
  </div>
<hr/>
<h3>Hodnotenia:</h3>
    @if(Auth::check()==false)
        <div class="alert alert-info">
            Iba prihlásený užívatelia môžu pridávať hodnotenia ku knihám.
        </div>
    @else
        <form action='/knihahodnotenie/pridat' method='POST'>
            @csrf
            <input type="hidden" name="book_id" value="{{ $book->id }}">
            <div class="form-row">
                <div class="col-3">
                    <label for='rating' style='font-weight: bold'>Hodnotenie: </label>
                </div>
                <div class="col-3">
                <select name="rating" class="form-control"  class="form-control{{ $errors->has('rating') ? ' is-invalid' : '' }}">
                    <option value="" <?= $u_comment->rating=="" or empty($u_comment->rating) ? 'selected' : '' ?>> -- hodnotenie -- </option>
                    <option value="1" <?= $u_comment->rating==1 ? 'selected' : '' ?>> * </option>
                    <option value="2" <?= $u_comment->rating==2 ? 'selected' : '' ?>> ** </option>
                    <option value="3" <?= $u_comment->rating==3 ? 'selected' : '' ?>> *** </option>
                    <option value="4" <?= $u_comment->rating==4 ? 'selected' : '' ?>> **** </option>
                    <option value="5" <?= $u_comment->rating==5 ? 'selected' : '' ?>> *****  </option>
                </select>
                </div>
                     <div class="col-4">
                        @if ($errors->has('rating'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('rating') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-3">
                        <label for='rating'>Text hodnotenia: </label>
                    </div>
                    <div class="col-9">
                    <textarea name="text"  class="form-control{{ $errors->has('text') ? ' is-invalid' : '' }}" style='min-height: 120px'>{{ $u_comment->text }}</textarea>
                        @if ($errors->has('text'))
                            <span class="invalid-feedback">
                            <strong>{{ $errors->first('text') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
            <div class="col-md-10 text-center" style='margin-top: 10px'>
                <button class="btn btn-primary">Uložiť</button>
                </form>
                @if($u_comm_exist)
                <form action="{{ url('knihahodnotenie/vymazat/'.$u_comment->id) }}" method="POST" style="display: inline">
                    @csrf
                    @method('delete')
                    <button class="btn btn-danger btn-sm"  style="margin-left: 10px" onclick="if (! confirm('Skutočne schcete vymazať Vaše hodnotenie?')) { return false; }">Vymazať</button>
                </form>
                @endif        
    </div>
    @endif
    
    <hr/>
    @foreach($comments_p as $comment)
    @if($comment->text!="")
        <div class='row'>
            <div class="col-3">
                <a href="{{ url('profil/'.$comment->user->name) }}" title="zobraziť profil">
                {{ $comment->user->getUsername().': ' }}</a>
                <br/>
                @for ($i = 1; $i <= 5; $i++)
   
                    <?php
                        for($i=1; $i<=5; $i++){
                            if($i<=$comment->rating){
                                echo '<i class="material-icons md-36"style="font-size:20px;">star</i>';
                            }else{
                                echo '<i class="material-icons md-36"style="font-size:20px;">star_border</i>';
                            }
                        }
                    ?>
                @endfor 
            </div>
            <div class="col-9">
                {{ $comment->text}}
            </div>
        </div>
    {{ $comments_p->links() }}
    <hr/>
    @endif
    @endforeach
 </div>
    
    <script>
      $(document).ready(function(){
          $("#set_favorit").click(function(){
              $.ajax({
                  url: "/kniha/pridatoblubenu/<?= $book->id ?>",
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
    @include('book.page_menu')
@endsection