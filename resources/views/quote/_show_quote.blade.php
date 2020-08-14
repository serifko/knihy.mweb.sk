    <div class='row'>
        <div class='col-10'>
            <blockquote class="blockquote">
                <q class="mb-0 quote" style="text-align: justify;">{{ $quote->text }}</q>
                <footer class="blockquote-footer" style="text-align: right">
                    <a href="{{ url('autor/'.$quote->author->slug) }}" title="{{ $quote->author->getName() }}">{{ $quote->author->getName() }} </a>
                <?= !empty($quote->book_id) ? '<cite title="'.$quote->author->getName().' - '.$quote->book->name.'">v knihe <a href="'.url('kniha/'.$quote->book->slug).'">'.$quote->book->name.'</a></cite>' : '' ?>
                </footer>
           </blockquote>
            @if(Auth::check() && Auth::user()->role>1 or Auth::check() && Auth::id()==$quote->user_id)
            <div style="text-align: left">
                <a href="citat/{{ $quote->id }}/upravit"> (upraviť) </a>
            </div>
            @endif
       </div>       
       <div class='col-2'>
           <span class="align-middle centered vote-up-icon" style='font-size:24px; margin: 0px; padding: 0px'>
               @if(empty(session('quote_vote_'.$quote->id)))
                   <a href="" id="vote_quote_{{ $quote->id }}">                   
                       <i class="material-icons align-middle" style="font-size:48px; margin: 0px; padding: 0px">arrow_drop_up</i>
                       <span id="votes_{{ $quote->id }}">{{ $quote->votes }}</span>
                   </a>
               @else
               <span title="Za tento citát ste už hlasovali. Ďakujeme." style="color:grey">
                   <i class="material-icons align-middle" style="font-size:48px; margin: 0px; padding: 0px">arrow_drop_up</i>
                   <span id="votes_{{ $quote->id }}">{{ $quote->votes }}</span>   
               </span>
               @endif
           </span>
        <hr/>
        <div class="fb-like" data-href="{{ url('citat/'.$quote->id) }}" data-layout="box_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
       </div>
    </div>
    <hr/>    
    <script>
      $(document).ready(function(){
          $("#vote_quote_<?= $quote->id ?>").click(function(){
              $.ajax({
                  url: "/citat/vote/<?= $quote->id ?>", 
                  success: function(result){
                            votes = parseInt($("#votes_<?= $quote->id ?>").text())+1;
                            $("#votes_<?= $quote->id ?>").text(votes);
                            $("#vote_quote_<?= $quote->id ?>").addClass('disabled');

                  }
              });
              return false;
          });
      });
    </script>
    
    
    