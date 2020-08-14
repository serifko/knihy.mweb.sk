@extends('layouts.app')

@section('content')
    <h1>Užívatelia</h1>
    <table class="table table-sm">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">name</th>
            <th scope="col">email</th>
            <th scope="col">RL</th>
            <th scope="col">povolenia</th>
            <th scope="col">skupiny</th>
          </tr>
        </thead>
        <tbody>
        @foreach($users as $user)
          <tr>
            <th scope="row"><?= $user->id ?></th>
            <td><?= $user->name ?></td>
            <td><?= $user->email ?></td>
            <td><?= $user->role ?></td>
            <td><a href='/admin/povolenia/<?= $user->id ?>/nastavit'>nastaviť povolenia</a></td>
            <td><a href='/admin/skupiny/<?= $user->id ?>/nastavit'>nastaviť skupiny</a></td>
          </tr> 
        @endforeach
        </tbody>
      </table>
    @if($users->count()==0)
        <span style='color: red'>Zatiaľ nie sú žiadny zaregistrovaný užívateľia.</span>
    @endif
    <div>
        {{ $users->links() }}
    </div>
@endsection
