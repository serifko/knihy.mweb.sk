@extends('layouts.app')
@section('title', 'upraviť knihu')
@section('content')
<h1>Upraviť knihu: <?= $book->name ?></h1>
<form action='/kniha/<?= $book->id ?>/upravit' method='POST' enctype='multipart/form-data'>
    @csrf
    @method('PUT')
    <div class="form-row">
    <div class="col-3">
            <img src="/uploads/books/<?= $book->cover_img ?? 'no_book.jpg' ?>" class="img-fluid rounded align-middle" style=" max-width: 200px; float: left; margin: 0px 15px 15px 0px"/>
    </div>
   
        <div class="col-4">
            <label for='author' style='font-weight: bold'>Autor: </label>
            <input type="text" name="author" id="author" value='{{ $book->author->getName() }}' maxlength="4" class="form-control{{ $errors->has('author_id') ? ' is-invalid' : '' }}">
            <input type="hidden" name="author_id" id="author_id" value="{{ $book->author_id }}">
            <small id="check" class="form-text text-muted">-</small>
                @if ($errors->has('author_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('author_id') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-5">
            <label for='name' style='font-weight: bold'>Názov knihy: </label>
            <input type='text' name='name' value='{{ $book->name }}' class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}">
                @if ($errors->has('name'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('name') }}</strong>
                    </span>
                @endif
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-6">
            <label for='original_name'>Originálny názov: </label>
            <input type="text" name="original_name" id="original_name" value='{{ $book->original_name }}' class="form-control{{ $errors->has('original_name') ? ' is-invalid' : '' }}">
                @if ($errors->has('original_name'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('original_name') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label for='publish_year'>Rok vydania: </label>
            <input type='text' name='publish_year' value='{{ $book->publish_year }}' class="form-control{{ $errors->has('publish_year') ? ' is-invalid' : '' }}">
                @if ($errors->has('publish_year'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('publish_year') }}</strong>
                    </span>
                @endif
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-6">
            <label for='cover_img'>Obal knižky: </label>
            <input type='file' name='cover_img' value='{{ $book->cover_img }}' class="form-control{{ $errors->has('cover_img') ? ' is-invalid' : '' }}">
                @if ($errors->has('cover_img'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('cover_img') }}</strong>
                    </span>
                @endif
                <br/>
            <label for='about'>O knižke: </label>
            <textarea name='about' onkeyup="countChar(this)" class="form-control{{ $errors->has('about') ? ' is-about' : '' }}" style="min-height: 300px">{{ $book->about }}</textarea>
            <p style="text-align: right" id="textNum">0/2500</p>
                @if ($errors->has('about'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('about') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-6">
            <label>Kategórie knihy: </label>
            <div class="form-row">
            <?php 
            $i=0;
            foreach($bookCategories as $bookCategory){
                if($i==2){ echo '</div><div class="form-row">'; }
                echo '<div class="col-6">';
                echo '<label for="bookCategory_'.$bookCategory->id.'"><input type="checkbox" name="bookCategory_'.$bookCategory->id.'" id="bookCategory_'.$bookCategory->id.'" ';
                foreach ($bookCategories_old as $bookCategory_old){
                    if ($bookCategory->id == $bookCategory_old->book_category_id) echo ' checked';
                }
                echo '/> '.$bookCategory->nazov.'</label>';
                echo '</div>';
            }         
            ?>             
            </div>
        </div>
    </div>
    <button name="submit" class="btn btn-primaty" style="margin-top: 20px"> Uložiť </button>
</form>
<hr/>
<h2>Vymazať knihu:</h2>
<form action='/kniha/<?= $book->id ?>/vymazat' method='POST'>
    @csrf
    @method('DELETE')
    <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
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
            onSelectItemEvent: function() {
              var author_id = $("#author").getSelectedItemData().id;
              $("#author_id").val(author_id).trigger("change");
            },
            onClickEvent: function() {
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
    
    function deletechecked()
    {
        if(confirm("Chcete vymazať túto skupinu?"))
        {
            return true;
        }
        else
        {
            return false;  
        } 
   }
</script>

@endsection



@section('page_menu')
    @include('book.page_menu')
@endsection
