<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-60205357-4"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-60205357-4');
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>
        @if(View::hasSection('title'))
            @yield('title') |  knihy.mweb.sk
        @else
            knihy.mweb.sk - citáty z kníh
        @endif
    </title>
    <meta name="description" content="Stránka venovaná knihám, vytváraniu databáze s knihami, autormi a citátmi z kníh.">
    <meta name="keywords" content="knihy, autori, zoznam kníh, hodntenia kníh, citáty z kníh, databáza kníh, pridávanie kníh, pridávanie autorov">
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/jquery-2.1.4.js') }}"></script>
    <script src="{{ asset('js/jquery.cookie.js') }}"></script>
    <script src="{{ asset('js/jquery.cookiecuttr.js') }}"></script>
    <script src="{{ asset('js/jquery.easy-autocomplete.js') }}" ></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/cookiecuttr.css') }}" rel="stylesheet">
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/easy-autocomplete.css') }}" rel="stylesheet">
		<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
    @if(!empty($fb_metas))
        @foreach($fb_metas as $key => $value)
        <meta property="og:{{ $key }}" content="{{ $value }}" />
        @endforeach
    @endif
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
</head>
<body>
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/sk_SK/sdk.js#xfbml=1&version=v2.9&appId=175962882940364";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    <div class="container">
        <div class="row">
            @include('layouts.nav_panel')
        </div>
        <div class="row">
            <div class="col-10" style="padding-top: 10px;">
                @if(session('succeed'))
                    <div class="alert alert-success alert-dismissible fade show" role="succeed">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                         </button>
                        {{ session('succeed') }}
                    </div>
                @endif
                @if(session('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="danger">
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                         </button>
                        {{ session('error') }}
                    </div>
                @endif
                @yield('content')
								<div class="app"></div>
							</div>

						 <div class="col-2" style='background-color: #DCDCDC'>
									@yield('page_menu')
									@include('layouts.side_panel')
							</div>
					 </div>
        </div>

        <div class= "row" style="margin-bottom:3em">
            <div class="col-12" style="text-align: center">
                @include('layouts.footer')
            </div>

        </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script>
    $(document).ready(function () {
        $.cookieCuttr(
            {
                cookieAnalyticsMessage: 'Tento web používa k poskytovaniu služieb, personalizácii reklám a analýze návštěvnosti súbory cookie. Používaním tohto webu s tým súhlasíte.'
            }
        );
    });
</script>

</html>
