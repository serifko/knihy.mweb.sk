<div class="col-12 bg-dark">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style='margin: 0px'>
            <a class="navbar-brand" href="{{ url('/') }}">knihy.mweb.sk</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="{{ url('autori') }}"> AUTORI </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="{{ url('knihy') }}"> KNIHY </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="{{ url('citaty') }}"> CITÁTY </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="{{ url('blog') }}"> BLOG </a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="{{ url('kontakt') }}"> KONTAKT </a>
              </li>
            </ul>
            <ul class="navbar-nav justify-content-end">

                @if(Auth::check())
                <li class="nav-item active">
                    <a class="nav-link" href="{{ url('profil') }}" title="PROFIL">
                        <img src="{{ asset('./public/images/profile.png') }}" style="max-width: 30px; max-height: 30px;">
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="{{ url('priatelia') }}" title="PRIATELIA">
                        <img src="{{ asset('./public/images/friends.png') }}" style="max-width: 30px; max-height: 30px;">
                    </a>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  title="NASTAVENIA">
                    <img src="{{ asset('./public/images/others.png') }}" style="max-width: 30px; max-height: 30px;">
                </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <span class="dropdown-item" style="font-weight:bold">{{ Auth::user()->name }}</span>
                        <a class="dropdown-item" href="{{ url('profil/nastavenie') }}">nastavenie profilu</a>
                        <a class="dropdown-item" href="{{ url('odhlasit') }}">ODHLÁSIŤ</a>
                      </div>
                    </li>
                @else

                    <li class="nav-item"><a class="nav-link" href="{{ url('prihlasit') }}">PRIHLÁSIŤ</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{ url('registracia') }}">REGISTRÁCIA</a></li>
                @endif
            </ul>
            </div>
        </nav>
</div>
