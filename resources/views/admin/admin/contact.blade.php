@extends('layouts.app')

@section('content')

<div style="float:right; width:100px; text-align: center">
    <a href="{{ url('/admin/kontakty') }}">
        <i class="material-icons">keyboard_backspace</i>
        <br/>SPÄŤ
    </a>
</div>

<h1>Správa od: <?= $contact->email ?></h1>
<?= $user ? 'Užívateľ: '. $user->name : '' ?>
<div class='row'>
    <div class="col-6">
        <h3>Správa:</h3>
        <p>
            {{ $contact->message }}
        </p>
    </div>
    <div class="col-2">
    <form action='/admin/kontakt/<?= $contact->id ?>/precitana' method='POST'>
        @csrf
        @method('PATCH')
        <button name="submit" class="btn btn-success" onclick="return readchecked();" <?= $contact->read ? 'disabled':'' ?>> Prečítaná </button>
    </form>
        <br/>
    <form action='/admin/kontakt/<?= $contact->id ?>/vymazat' method='POST'>
        @csrf
        @method('DELETE')
        <button name="submit" class="btn btn-danger" onclick="return deletechecked();"> Vymazať </button>
    </form>
    </div>
</div>


<script>
    function readchecked()
    {
        if(confirm("Chcete túto správu označiť ako prečítanú?")) {
            return true;
        }else{
            return false;  
        } 
   }
    function deletechecked()
    {
        if(confirm("Chcete vymazať túto správu?")) {
            return true;
        }else{
            return false;  
        } 
   }
</script>
@endsection
