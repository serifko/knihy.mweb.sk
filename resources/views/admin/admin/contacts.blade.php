@extends('layouts.app')

@section('content')
<h1>Kontakty: </h1>
<table class="table table-sm">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">email: </td>
        <th scope="col">sprava: </td>
        <th scope="col">prečítaná: </td>
    </tr>       
    </thead>
    <tbody>
    @foreach ($contacts as $contact)
        <tr>
            <th scope="row"><?= $contact->id ?></th>
            <td><?= $contact->email ?> <?= $contact->email!=0 ? ' -reg.užív.' : '' ?></td>
            <td><?= strlen($contact->message)>150 ? substr($contact->message, 0, 150).'...' : $contact->message ?> - <a href='kontakt/{{ $contact->id }}'>(zobraziť)</a></td>
            <td><?= $contact->read==1 ? '<i class="material-icons align-middle" style="font-size:24px; color: green">check</i>' : '<i class="material-icons align-middle" style="font-size:24px; color: red">close</i>' ?></td>
        </tr>    
    @endforeach
    </tbody>
    </table>
<?= $contacts->links() ?>
<?= ($contacts->count()==0) ? '<span style="color:red">Zatiaľ nie sú pridané žiadne správy.</span>' : '' ?>

@endsection
