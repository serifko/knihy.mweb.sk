@extends('layouts.app')
@section('title', 'Upraviť novinku:')
@section('content')
<h3>Upraviť novinku:</h3>
<span><a href="{{ url('admin/novinky') }}"><- novinky</a></span>
<form action='/admin/novinky/{{ $new->id }}/upravit' method='POST' enctype='multipart/form-data'>
    @csrf 
    @method('put')
    <div class="form-row">
        <div class="col-6">
            <label for='title' style='font-weight: bold'>Nadpis: </label>
            <input type="text" name="title" id="author" value='{{ $new->title }}' class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}">
                @if ($errors->has('title'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('title') }}</strong>
                    </span>
                @endif
        </div>   
        <div class="col-6">
            <label for='public_at' style='font-weight: bold'>Text: </label>
            <input type="datetime-local" name="public_at" id="public_at" value='{{ $new->public_at }}' class="form-control{{ $errors->has('public_at') ? ' is-invalid' : '' }}">
                @if ($errors->has('public_at'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('public_at') }}</strong>
                    </span>
                @endif
        </div>
</div>
    <div class="form-row">
        <div class="col-12">
            <label for='text' style='font-weight: bold'>Text: </label>
            <textarea name="text" class="form-control{{ $errors->has('text') ? ' is-invalid' : '' }}">{{ $new->text }}</textarea>
                @if ($errors->has('text'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('text') }}</strong>
                    </span>
                @endif
        </div>  
          </div>  
    <button name="submit" class="btn btn-primaty" style="margin-top: 20px"> Uložiť </button>
</form>
<hr/>
<form action='/admin/novinky/{{ $new->id }}/vymazat' method='POST' enctype='multipart/form-data'>
    @csrf 
    @method('delete')
    <button name="submit" class="btn btn-danger" style="margin-top: 20px" onclick="return deletechecked();"> Vymazať </button>
</form>


<script>
    function deletechecked()
    {
        confirm("Chcete vymazať túto novinku?") ? true : false;
    }
</script>
@endsection

