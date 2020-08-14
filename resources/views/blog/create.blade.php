@extends('layouts.app')

@section('title', 'pridať príspevok')

@section('content')

<h1>Pridanie príspevku: </h1>

<form action='/blog/pridat' method='POST' enctype='multipart/form-data'>
    @csrf 
    <div class="form-row">
        <div class="col-6">
            <label for='title' style='font-weight: bold'>Názov príspevku: </label>
            <input type="text" name="title" id="author" value='{{ old("title") }}' class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}">
                @if ($errors->has('title'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('title') }}</strong>
                    </span>
                @endif
            <br/>
            <label for='link_type' style='font-weight: bold'>Typ príspevku: </label>
            <select name="link_type" id="link_type" class="form-control{{ $errors->has('link_type') ? ' is-invalid' : '' }}">
                <option value='' <?= old("link_type")== "" ? 'selected' : '' ?>>-- všobecný --</option>
                <option value='1'<?= old("link_type")== 1 ? 'selected' : '' ?>>-> o knihe <-</option>       
                <option value='2'<?= old("link_type")== 2 ? 'selected' : '' ?>>->  o autorovi <-</option>
                <option value='3'<?= old("link_type")== 3  ? 'selected' : '' ?>>->  citáty <-</option>
            </select>
            <input type="hidden" name="link_type_id" id="link_type_id" value="{{ old('link_type') }}">
                @if ($errors->has('link_type'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('link_type') }}</strong>
                    </span>
                @endif
            <br/>
            <input type="text" name="link" id="link" value='{{ old("link") }}' placeholder="kniha/autor o ktorom je príspevok" class="form-control{{ $errors->has('link_id') ? ' is-invalid' : '' }}">
            <input type="hidden" name="link_id" id="link_id" value="{{ old('link_id') }}">
            <small id="check_link" class="form-text text-muted">-</small>
                @if ($errors->has('link_id'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('link_id') }}</strong>
                    </span>
                @endif

            <label for='title_image' style='font-weight: bold'>Titulný obrázok: </label>
            <input type='file' name='title_image' value='{{ old("title_image") }}' class="form-control{{ $errors->has('title_image') ? ' is-invalid' : '' }}">
                @if ($errors->has('title_image'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('title_image') }}</strong>
                    </span>
                @endif
        </div>
        <div class="col-3" style="margin-left:50px">
            <label for='publish_date' style='font-weight: bold'>Dátum zverejnenia: </label>
            <input type="datetime-local" name="publish_date" id="publish_date" value='{{ old("publish_date") }}' class="form-control{{ $errors->has('publish_date') ? ' is-invalid' : '' }}">
                @if ($errors->has('publish_date'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('publish_date') }}</strong>
                    </span>
                <small>Nastavené na: <?= empty(old('publish_date')) ? 'nenastavené' : date("d.m.Y H:i", old('publish_date')) ?></small>
                @endif
            <br/> 
            <label for="is_publised"><input type="checkbox" name="is_publised" id="is_publised" <?= empty(old('is_publised')) ? '' : 'checked="checked"' ?>> zverejnené</label>
        </div>
    </div>
    <br/>
    <div class="form-row">
        <div class="col-12">
            <label for='text' style='font-weight: bold'>Text príspevku: </label>
            <textarea name='text' id='text' onkeyup="countChar(this)" class="form-control{{ $errors->has('text') ? ' is-invalid' : '' }}" style='width:100%; height: 20em; border: 1px solid black;'>{!! old('text') !!}</textarea>
            <br/>
            <div id="textNum" align="right">0/5000</div>
            @if ($errors->has('text'))
                <span class="invalid-feedback">
                <strong>{{ $errors->first('text') }}</strong>
                </span>
            @endif
        </div>
    </div>
    <button name="submit" class="btn btn-primary centered" style="margin-top: 20px"> Uložiť </button>
</form>


<script type="text/javascript">
    $("#link_type").change(function() {
    $("#link_type_id").val($("select#link_type option:selected").val());
    var options = {
    	url: "/getLinkBlogPost?link_type=" + $("#link_type_id").val(),
    	getValue: "name",
    	list: {
            maxNumberOfElements: 5,
            match: {
                enabled: true
            },
            onChooseEvent: function() {
              var link_id = $("#link").getSelectedItemData().id;
              $("#link_id").val(link_id).trigger("change");
              $("#check_link").html('<span style="color:green">OK</span>');
            },
            onShowListEvent: function() {
                $("#check_link").html('<span style="color:red">neplatná kniha!</span>');
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
    $("#link").easyAutocomplete(options);
  });

    function countChar(val) {
        var len = val.value.length;
        if (len >= 5000) {
          val.value = val.value.substring(0, 5000);
        } else { 
          $('#textNum').text(len + "/5000");
        }
   };
   
    ClassicEditor
        .create( document.querySelector( '#text' ) )
	.then( editor => {
            console.log( editor );
	} )
	.catch( error => {
            console.error( error );
	} );  
</script>


@endsection
