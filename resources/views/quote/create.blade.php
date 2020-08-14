@extends('layouts.app')

@section('title', 'pridať citát')

@section('content')
<h1>Pridanie citátu: </h1>

<form action='/citat/pridat' method='POST' enctype='multipart/form-data'>
    @csrf 
    <div class="form-row">
        <div class="col-6">
            <label for='author' style='font-weight: bold'>Autor: </label>
            <input type="text" name="author" id="author" value='{{ old("author") }}' class="form-control{{ $errors->has('author_id') ? ' is-invalid' : '' }}">
            <input type="hidden" name="author_id" id="author_id" value="{{ old('author_id') }}">
            <small id="check" class="form-text text-muted">-</small>
                @if ($errors->has('author_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('author_id') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label for='book'>Kniha: </label>
            <input type="text" name="book" id="book" value='{{ old("book") }}' class="form-control{{ $errors->has('book_id') ? ' is-invalid' : '' }}">
            <input type="hidden" name="book_id" id="book_id" value="{{ old('book_id') }}">
            <small id="check_book" class="form-text text-muted">-</small>
                @if ($errors->has('book_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('book_id') }}</strong>
                    </span>
                @endif
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-6">
            <label for='quoteCategory_id' style='font-weight: bold'>Kategória citátu: </label>
            <select name="quoteCategory_id" id="quoteCategory_id" class="form-control{{ $errors->has('quoteCategory_id') ? ' is-invalid' : '' }}">
                <option value=''>-- kategória citátu --</option>
                <?php
                foreach($quoteCategories as $quoteCategory){
                    echo '<option value="'.$quoteCategory->id.' "';
                    if($quoteCategory->id==old('quoteCategory_id')) echo 'selected';
                    echo '>'.$quoteCategory->nazov.'</option>';
                }
                ?>
            </select>
                @if ($errors->has('quoteCategory_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('quoteCategory_id') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-12">
            <label for='text' style='font-weight: bold'>Text citátu: </label>
            <textarea name='text' id='text' onkeyup="countChar(this)" class="form-control{{ $errors->has('text') ? ' is-invalid' : '' }}" style='height: 150px'>{{ old('text') }}</textarea>
            <p style="text-align: right" id="textNum">0/2500</p>
            @if ($errors->has('text'))
                <span class="invalid-feedback">
                <strong>{{ $errors->first('text') }}</strong>
                </span>
            @endif

    </div>
    </div>
    <button name="submit" class="btn btn-primaty" style="margin-top: 20px"> Uložiť </button>
</form>


<script type="text/javascript">
    //* AUTOCOMPLETE AUTOR
    var options = {
    	url: "/autocomplete_author",
    	getValue: "name",
    	list: {
            maxNumberOfElements: 5,
            match: {
                enabled: true
            },
            onChooseEvent: function() {
              var author_id = $("#author").getSelectedItemData().id;
              $("#author_id").val(author_id).trigger("change");
              $("#check").html('<span style="color:green">OK</span>');
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
    $("#author").easyAutocomplete(options);
    
    //* AUTOCOMPLETE BOOK
//* AUTOCOMPLETE KNIHY
$("#author_id").change(function() {
var author_id = $("#author_id").val() 
    var options_books = {
    	url: "/autocomplete_book?author_id=" + author_id,
    	getValue: "name",
    	list: {
            maxNumberOfElements: 5,
            match: {
                enabled: true
            },
            onChooseEvent: function() {
              var book_id = $("#book").getSelectedItemData().id;
              $("#book_id").val(book_id).trigger("change");
              $("#check_book").html('<span style="color:green">OK</span>');
            },
            onShowListEvent: function() {
                $("#check_book").html('<span style="color:red">neplatná kniha!</span>');
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
    $("#book").easyAutocomplete(options_books);
   });
   
   
    function countChar(val) {
        var len = val.value.length;
        if (len >= 2500) {
          val.value = val.value.substring(0, 2500);
        } else { 
          $('#textNum').text(len + "/2500");
        }
   };
</script>

@endsection


@section('page_menu')
    @include('quote.page_menu')
@endsection