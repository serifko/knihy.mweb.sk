
@if(Auth::check() && Auth::user()->role>1)
<div class="row">
    <div class="col-12">
        <span class='centered'><a href="{{ url('admin') }}">Administrácia</a></span>
        <hr/>
    </div>
</div>
@endif


@if(Auth::check())
<?php $books_statuses = Auth::user()->readings()->where('status', 0)->get() ?>
<h4 style="font-size: 1.3em; font-weight: bold; padding-bottom: 0px; margin-bottom: 0px; margin-top: 5px;">Teraz čítaš:</h4>
    @if($books_statuses->count()>0)
        @if($books_statuses->count()<=2)
            @foreach($books_statuses as $book_status)
            <?php $book = $book_status->book; ?>
            <div class="row">
                <div class="col-12" style="text-align:center; display: inline-block; vertical-align:top; line-height: 100%">
                  <a href="{{ url('kniha/'.$book->slug) }}" style=''>
                  <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style="width: 120px; padding-bottom: 5px"/><br/>
                  <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
                  <small style="margin-bottom:0px;padding-bottom:0px"><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small>
                  <hr/>    
                </div>
            </div>     
            @endforeach       
        @else
            @foreach($books_statuses as $book_status)
            <?php $book = $book_status->book; ?>
            <div class="row">
                <div class="col-12" style="text-align:center; display: inline-block; vertical-align:top; line-height: 100%">
                    <a href="{{ url('kniha/'.$book->slug) }}" style=''>
                    <span style="margin-bottom:0px;padding-bottom:0px" class='align-text-bottom'><?= $book->name ?></span></a><br/>
                    <small style="margin-bottom:0px;padding-bottom:0px"><a href="{{ url('autor/'.$book->author->slug) }}">({{ $book->author->getName() }})</a></small>
                <hr/>         
                </div>
            </div>       
            @endforeach
        @endif
    @else
        Teraz nemáš rozčítanú žiadnu knihu. Zmeň to! :-)
    @endif
@else
 
@endif
