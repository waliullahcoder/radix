<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                     <div class="col-lg-8 col-md-8">
                        <div class="header__top__left">
                            <ul class="top-left-list">
                                <li class="email-item">
                                    <i class="fa fa-envelope"></i> {{$settings->primary_email}}
                                </li>
                                <li class="marquee-item">
                                    <div class="marquee">
                                        <span>
                                            🚚 {{ $settings->google_map ?? 'Please Set Marquee Message' }}
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="{{ $settings->facebook_page ?? '#' }}" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="{{ $settings->twitter ?? '#' }}" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="{{ $settings->linkedin ?? '#' }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                                <a href="{{ $settings->pinterest ?? '#' }}" target="_blank"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="frontend/images/language.png" alt="" loading="lazy" decoding="async">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="{{ route('auth.signupPage') }}"><i class="fa fa-user"></i> Signup</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .sticky-header {
    width: 100%;
    transition: all 0.3s ease;
}

.sticky-active {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    background: #fff;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
}

            </style>
        <div class="sticky-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="{{route('home')}}">
                        <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo.png') }}" 
                             alt="">
                    </a>
                </div>
            </div>

            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="{{route('home')}}">Home</a></li>

                        @foreach ($menus['header_parent'] as $menu)
                        <li>
                            <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">
                                {{$menu->name}}
                                @if(isset($menus['header_child'][$menu->id]) && $menus['header_child'][$menu->id]->count() > 0)
                                    <span class="arrow_carrot-down"></span>
                                @endif
                            </a>

                            @if(isset($menus['header_child'][$menu->id]))
                                @foreach ($menus['header_child'][$menu->id]->chunk(3) as $chunk)
                                    <ul class="header__menu__dropdown">
                                        @foreach ($chunk as $item)
                                            <li>
                                                <a href="{{route('category.singleCategoryPage', $item->id)}}">
                                                    {{ $item->name }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                @endforeach
                            @endif
                        </li>
                        @endforeach

                        <li><a href="#">Contact</a></li>
                    </ul>
                </nav>
            </div>

            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li>
                            <a href="{{ route('cart.index') }}" class="cart-icon">
                                <i class="fa fa-shopping-bag"></i> 
                                <span class="cart-count">{{ count(session('cart', [])) }}</span>
                            </a>
                        </li>
                    </ul>

                    @if (Auth::check())
                        <a class="header-link" href="{{ Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard') }}">
                            <strong>{{ Auth::user()->name }}</strong>
                        </a>
                    @else
                        <a class="header-link" href="{{route('auth.signinPage') }}">
                            <i class="fa fa-user"></i>
                            <span class="d-sm-inline-block d-none">Sign in</span>
                        </a>
                    @endif
                </div>
            </div>
        </div>

        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</div>

    </header>