@extends('layouts.app')
@section('title', 'Pridať novinku:')
@section('content')
<h3>Pridať novinku:</h3>
<form action='/admin/novinky/pridat' method='POST' enctype='multipart/form-data'>
    @csrf 
    <div class="form-row">
        <div class="col-6">
            <label for='title' style='font-weight: bold'>Nadpis: </label>
            <input type="text" name="title" id="author" value='{{ old("title") }}' class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}">
                @if ($errors->has('title'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('title') }}</strong>
                    </span>
                @endif
        </div>   
        <div class="col-6">
            <label for='public_at' style='font-weight: bold'>Dátum: </label>
            <input type="datetime-local" name="public_at" id="public_at" value='{{ old("public_at") }}' class="form-control{{ $errors->has('public_at') ? ' is-invalid' : '' }}">
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
            <textarea name="text" class="form-control{{ $errors->has('text') ? ' is-invalid' : '' }}">{{ old('text') }}</textarea>
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
<h3>Novinky:</h3>
    <table class="table table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">nadpis:</th>
            <th scope="col">text:</th>
            <th scope="col">upraviť</th>
          </tr>
        </thead>
        <tbody>
        @foreach ($news as $new)
          <tr>
            <th scope="row"><?= $new->id ?></th>
            <td><?= $new->title ?></td>
            <td><?= str_limit($new->text, 350) ?></td>
            <td><a href='/admin/novinky/{{ $new->id }}/upravit'> upraviť </a></td>
          </tr> 
        @endforeach
        </tbody>
</table>
{{ $news->links() }}
@if(count($news)==0)
    <span style="color:red">Zatiaľ nie su pridané žiadne novinky.</span>
@endif

@endsection

