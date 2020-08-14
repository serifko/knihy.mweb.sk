@extends('layouts.app')

@section('title', 'blokovanie užívateľov')
@section('content')

<h2>Blokovanie užívateľov:</h2>
<div class="row">
    <div class="col-6">
        <span style="font-weight: bold; ">Tebou blokovaní užívatelia: </span>
            <table>
            @foreach($myBlocks as $myBlock)
            <tr>
                <td><a href="{{ url('profil/'.$myBlock->otherUser()->name) }}">{{ $myBlock->otherUser()->name }}</a></td>
                <td>
                    <a href="{{ url('blokovat/zrusit/'.$myBlock->otherUser()->id) }}"  onclick="if (! confirm('Skutočne schcete zrušiť blokovanie užívateľa {{ $myBlock->otherUser()->name }}?')) { return false; }">
                    <img src="{{ asset('/public/images/close.png') }}" style="max-width:30px; max-height: 30px"/>
                    </a>
                </td>
            </tr>
            @endforeach
            </table>
            @if(count($myBlocks)==0)
                <span>Prístup k tvojmu profilu nemá zatiaľ nikto zablokovaný.</span>
            @endif
    </div>
    
    
    
    <div class="col-6">
        <span style="font-weight: bold; ">Užívatelia ktorí ťa blokujú: </span>
            <table>
            @foreach($iBlocks as $iBlock)
                <tr>
                    <td>{{ $iBlock->otherUser()->name }}</td>
                    <td></td>
                </tr>        
            @endforeach
            </table>
            @if(count($iBlocks)==0)
                <span>Nemáš zablokovaný prístup k žiadnemu účtu.</span>
            @endif  
    </div>
    
    
    
</div>

@endsection

@section('page_menu')
    <div class="r_vert_menu">
        <ul>
         <li><a class="dropdown-item" href="{{ url('priatelia') }}">priatelia</a></li>
       </ul>
    </div>
<hr/>
@endsection