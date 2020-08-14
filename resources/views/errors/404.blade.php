@extends('layouts.app')
@section('title', 'ERROR 404')
@section('content')
<h1>404 stránka nenájdená: </h1>
<table>
    <tr>
        <td style='width:50%'>
           <img src="./public/images/404.png" /> 
        </td>
        <td style='width:50%; text-align: center; vertical-align: center;'>
            <a href="{{ url('/') }}"><button class='btn btn-info btn-lg'  style="border:1px solid black">domovská <br/>stránka</button></a>
        </td>
    </tr>
</table>


@endsection
