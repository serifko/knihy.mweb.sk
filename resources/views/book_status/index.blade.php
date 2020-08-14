@extends('layouts.app')
@section('title', 'Moje čítanie v roku '.$selYear)
@section('content')
<h1>Moje čítanie v roku 
    <form style="display: inline">
                <select name="selYear" id="selYear">
                    @foreach($bookYears as $bookYear)
                        <option value="{{ $bookYear['year'] }}" <?=  $bookYear['year']==$selYear ? 'selected' : '' ?>>{{ $bookYear['year'] }}</option>
                    @endforeach
                </select>
    </form>
</h1>
<div style="font-size: 1.2em">
    <span>Počet prečítaných kníh celkovo: <span style="font-weight: bold">{{ $book_statuses_all }}</span></span><br/>
    <span>Počet prečítaných kníh v tomto roku:  <span style="font-weight: bold">{{ $book_statuses_year }}</span></span>
    <hr/>
</div>
    @foreach($book_statuses as $book_status)
        <?php
        $book = $book_status->book;
        ?>
        <div style="text-align:center; display: inline-block; vertical-align:top; width:170px; padding:5px; margin-right: 15px; height: auto; line-height: 100%; margin-bottom: 10px">
            <a href="{{ url('kniha/'.$book->slug) }}" style=''>
               @if($book_status->status==0)
                    <?php $popis='Začal si čítať '.date("d.m.Y", strtotime($book_status->updated_at)).'.'; ?>
               @else
                    <?php $popis='Dočítal si '.date("d.m.Y", strtotime($book_status->updated_at)).'.'; ?>
               @endif
              <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" title='<?= $popis ?>' class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
              <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
              <small><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small><br/>
              <small><a href="{{ url('mojecitanie/'.$book_status->id.'/vymazat') }}" style="color:red" onclick="if (! confirm('Skutočne schcete záznam o prečítaní knihy {{$book->name}} od {{$book->author->getName()}}.')) { return false; }">(vymazať záznam)</a></small>
         </div>
    @endforeach
    @if(count($book_statuses)==0)
        <span style="color: red;">Zatiaľ nemáte žiadne knihy označené ako prečítané.</span>
    @endif
    <div class="text-center">
        <?= $book_statuses->links() ?>
    </div>
    
@endsection


@section('page_menu')
   @if($user_id!=Auth::id())
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
    <div class="r_vert_menu">
        <ul>
         <li><a class="dropdown-item" href="{{ url('mojecitanie') }}">moje čítanie</a></li>
         <li><a class="dropdown-item" href="{{ url('oblubeneknihy') }}">obľúbené knihy</a></li>
         <li><a class="dropdown-item" href="{{ url('oblubeniautori') }}">obľúbení autori</a></li>
       </ul>
    </div>



<script>
    $('form').on('keyup change paste', 'input, select, textarea', function(){
        var selYear = $("#selYear option:selected").val();
        var base_url = <?= json_encode(url('/mojecitanie/')) ?>+ "/"+selYear;
        window.location.href = base_url;
    });
</script>
@endsection