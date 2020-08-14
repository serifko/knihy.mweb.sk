@extends('layouts.app')

@section('content')
<h1>Národnosti: </h1>
    <table class="table table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">národnosť</th>
            <th scope="col">skratka</th>
            <th scope="col">flag</th>
            <th scope="col">upraviť</th>
          </tr>
        </thead>
        <tbody>
        @foreach ($nations as $nation)
          <tr>
            <th scope="row"><?= $nation->id ?></th>
            <td><?= $nation->name_nation ?></td>
            <td><?= $nation->skratka_nation ?></td>
            <td><img src='/uploads/nations/<?= $nation->flag_nation ?>' style="max-height: 25px" class="align-baseline"></td>
            <td><a href='/admin/narodnosti/<?= $nation->id ?>/upravit'> upraviť </a></td>
          </tr> 
        @endforeach
        </tbody>
</table>
    <?= ($nations->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne národnosti.</span>' : '' ?>
<div class="center-block"><?= $nations->links() ?></div>
<br/><hr/>
<h2>Pridanie národnosti:</h2>
<form action='/admin/narodnosti/pridat' method='POST' enctype='multipart/form-data'>
    @csrf
    <table>
        <tr>
            <td><label for='name_nation'>Národnosť: </label></td>
            <td><input type='text' name='name_nation' value='{{ old("name_nation") }}' class="form-control{{ $errors->has('name_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('name_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('name_nation') }}</strong>
                    </span>
                @endif
        </td>
        </tr>
        <tr>
            <td><label for='skratka_nation'>Skratka: </label></td>
            <td><input type='text' name='skratka_nation' maxlength="6" value='{{ old("skratka_nation") }}' class="form-control{{ $errors->has('skratka_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('skratka_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('skratka_nation') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
        <tr>
            <td><label for='flag_nation'>Vlajka: </label></td>
            <td><input type='file' name='flag_nation' value='{{ old("flag_nation") }}' class="form-control{{ $errors->has('flag_nation') ? ' is-invalid' : '' }}">
                @if ($errors->has('flag_nation'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('flag_nation') }}</strong>
                    </span>
                @endif
            </td>
        </tr>
    </table>
    <button name="submit" class="btn btn-primaty"> Uložiť </button>
</form>
@endsection
