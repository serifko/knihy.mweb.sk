@extends('layouts.app')

@section('content')
        <div class="jumbotron col-12" style='padding-top: 10px '>
          <h3>Vyhľadávanie</h3>
          <div class='row form-row'>
              <div class="col-1" style='text-align: right'>
                  <i class="material-icons md-36" style="font-size:28px;">search</i>
              </div>
							<div class="col-11">
										<form action="">
											 <input type="search" class='form-control' name="search" id="search" value='{{ old("search") }}'>
											 <input type="hidden" name="search_link" id="search_link" value="{{ old('search_link') }}">
										 </form>
							</div>
						</div>
				</div>
    @if(!Auth::check())
    <div class='row'>
        <div class="col-8">
            <h1 class="display-10">Vitaj v KNIHÁRNI</h1>
              <p class="lead" style='width: 100%'>
				  Mám rád knihy a aj programovanie(ako koníček). <br/>
				  Občas vo voľnom čase po práci niečo nakódujem a momentálne sa zabávam na tomto.<br/>
				  Pridávam sem len knihy ktoré sám čítam, a ak v danej knihe narazím na zaujímavý citát tak sem vložím aj ten.
              </p>
        </div>
        <div class="col-4">
					<table class="table table-separed">
						<thead class="thead-dark">
							<tr><h5>Novinky:</h5></tr>
						</thead>
						@foreach($news as $new)
							<tr>
								<td class='small'>
									 @if(!empty($new->title))
									 <span style='font-weight: bold; text-decoration: underline'>{{ $new->title }}</span><br/>
									 @endif
									 <span style='font-weight: bold'>{{ date("d.m.Y H:i", strtotime($new->public_at)) }}: </span>
										{{ $new->text }}
								</td>
							</tr>
            @endforeach
					</table>
        </div>
     </div>
    @else
            <div class='row'>
        <div class="col-6">
            <h3 class="display-10">Tvoja štatistika:</h3>
            <table>
                <tr>
                    <td>Počet prečítaných kníh:</td>
                    <td>{{ $stat['read'] }}</td>
                </tr>
                <tr>
                    <td>Počet prečítaných kníh v tomto roku:</td>
                    <td>{{ $stat['read_ty'] }}</td>
                </tr>
                <tr>
                    <td>Počet prečítaných kníh v minulom roku:</td>
                    <td>{{ $stat['read_py'] }}</td>
                </tr>
                <tr>
                    <td>Počet rozčítaných kníh:</td>
                    <td>{{ $stat['read_cur'] }}</td>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>Počet pridaných autorov:</td>
                    <td>{{ $stat['author_add'] }}</td>
                </tr>
                <tr>
                    <td>Počet pridaných kníh:</td>
                    <td>{{ $stat['book_add'] }}</td>
                </tr>
                <tr>
                    <td>Počet zhodnotených kníh:</td>
                    <td>{{ $stat['book_comm_add'] }}</td>
                </tr>
                <tr>
                    <td>Počet pridaných citátov:</td>
                    <td>{{ $stat['quote_add'] }}</td>
                </tr>
            </table>
        </div>
        <div class="col-4" style='text-align: center'>
            <h3>Tvoje body za aktivitu:</h3>
            <div title="Tvoje body za aktivitu: {{ number_format(round($points, 1), 1) }}" class="rounded" 
								 style="width: 250px; height:60px; background-color:#3399ff; color:white; font-weight: bold; font-size:48px; vertical-align:middle" >
            <i class="material-icons md-36" style="font-size:28px;">star</i> {{ number_format(round($points, 1), 1) }}
            </div>
        </div>
     </div>
    
    @endif


<script type="text/javascript">
       //* AUTOCOMPLETE AUTOR
    var options = {
    	url: "/autocomplete_search",
    	getValue: "name",
    	list: {
            maxNumberOfElements: 10,
            match: {
                enabled: true
            },
            onChooseEvent: function() {
								var link = $("#search").getSelectedItemData().link
								window.location.href = link;
            },
            onShowListEvent: function() {
                $("#check").html('<span style="color:red">neplatný autor!</span>');
            },
            showAnimation: {
                type: "fade", //normal|slide|fade
                time: 400,
                callback: function() {}
            },
            sort: {
                enabled: true
            }
        }
    };
    $("#search").easyAutocomplete(options);
</script>



@endsection
