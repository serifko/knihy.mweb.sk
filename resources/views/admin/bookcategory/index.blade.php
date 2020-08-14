@extends('layouts.app')

@section('content')
<h1>Knihy - kategórie: </h1>
    <table class="table table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">názov</th>
            <th scope="col">slug</th>
            <th scope="col">upraviť</th>
          </tr>
        </thead>
        <tbody>
        @foreach ($bookCategories as $bookCategory)
          <tr>
            <th scope="row"><?= $bookCategory->id ?></th>
            <td><?= $bookCategory->nazov ?></td>
            <td><?= $bookCategory->slug ?></td>
            <td><a href='/admin/knihykategorie/<?= $bookCategory->id ?>/upravit'> upraviť </a></td>
          </tr> 
        @endforeach
        </tbody>
</table>
    <?= ($bookCategories->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne kategórie kníh.</span>' : '' ?>
<br/><hr/>
<h2>Pridanie kategóie:</h2>
<form action='/admin/knihykategorie/pridat' method='POST' enctype='multipart/form-data'>
    @csrf
    <table>
        <tr>
            <td><label for='nazov'>Názov kategórie: </label></td>
            <td><input type='text' name='nazov' value='{{ old("nazov") }}' class="form-control{{ $errors->has('nazov') ? ' is-invalid' : '' }}">
                @if ($errors->has('nazov'))
                    <span class="invalid-feedback">
                    <strong>{{ $errors->first('nazov') }}</strong>
                    </span>
                @endif
        </td>
        </tr> 
    </table>
    <button name="submit" class="btn btn-primaty"> Uložiť </button>
</form>
@endsection
