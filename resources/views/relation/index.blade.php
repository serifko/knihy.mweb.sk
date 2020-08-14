@extends('layouts.app')

@section('title', 'priatelia')
@section('content')
<h2>Priatelia</h2>
    @if(count($friendships)>0)
        @foreach($friendships as $friendship)
        <div style='width:10%; display: inline-block; text-align: center;'>
                <a href="{{ url('profil/'.$friendship->otherUser()->name) }}">
                <?php
                    if(!empty($friendship->otherUser()->userProfile->photo) && ($friendship->otherUser()->userProfile->photo_pub>0)){
                        $photo = $friendship->otherUser()->userProfile->photo;
                    } else {
                        $photo = 'silueta.png';
                    }
                ?>
                <img src="/uploads/profiles/<?= $photo ?>" class="img-fluid rounded-circle align-middle" style="margin: 0% 5% 5% 0%; "/>    
              {{ $friendship->otherUser()->getUsername() }}  
            </a>
        </div>   
        @endforeach
    @else
        <span>Zatiaľ nemáte žiadnych priateľov. (aspoň na tejto stránke, v realite je to snáď lepšie)</span>
    @endif
@endsection


@section('page_menu')
    <div class="r_vert_menu">
        <ul>
         <li><a class="dropdown-item" href="{{ url('blokovanie') }}">blokovanie</a></li>
       </ul>
    </div>
<hr/>

<div style="margin-top: 10px;  font-size: .95em">
    <span style="font-weight: bold; text-decoration: underline;">Žiadosti o priateľstvo:</span><br/>
    @if(count($friendRequests)>0)
    <table>
        @foreach($friendRequests as $friendRequest)
        <tr>    
            <td><a href="{{ url('profil/'.$friendRequest->otherUser()->username) }}">{{ $friendRequest->otherUser()->getUsername() }}</a></td>
            <td style="margin-left: 10px">
                <a href="{{ url('/priatelstvo/ziadost/potvrdit/'.$friendRequest->otherUser()->id) }}" title="prijať žiadosť o priateľstvo">
                    <img src="{{ asset('/public/images/check.png') }}" style="max-width:30px; max-height: 30px"/>
                </a>
            </td>
            <td style="margin-left: 10px">
                <a href="{{ url('/priatelstvo/ziadost/zrusit/'.$friendRequest->otherUser()->id) }}" title="zrušiť žiadosť o priateľstvo">
                    <img src="{{ asset('/public/images/basket.png') }}" style="max-width:30px; max-height: 30px"/>
                </a>
            </td>
        <tr/>
        @endforeach 
    </table>
    @else
        <span>žiadne žiadosti o priateľstvo</span>
    @endif
</div>
    <hr/>
<div style="margin-top: 10px;  font-size: .95em">
    <span style="font-weight: bold; text-decoration: underline;">Tvoje žiadosti:</span><br/>
    @if(count($friendMyRequests)>0)
    <table>
        @foreach($friendMyRequests as $friendRequest)
        <tr>    
            <td style="vertical-align:middle"><a href="{{ url('profil/'.$friendRequest->otherUser()->username) }}">{{ $friendRequest->otherUser()->getUsername() }}</a></td>
            <td style="margin-left: 10px; vertical-align:middle">
                <a href="{{ url('/priatelstvo/ziadost/zrusit/'.$friendRequest->otherUser()->id) }}" title="zrušiť žiadosť o priateľstvo">
                    <img src="{{ asset('./public/images/basket.png') }}" style="max-width:45px; max-height: 45px"/>
                </a>
            </td>
        <tr/>
        @endforeach 
    </table>
    @else
        <span>žiadne žiadosti o priateľstvo</span>
    @endif
    <hr/>
</div>



@endsection


@section('page_menu')



@endsection