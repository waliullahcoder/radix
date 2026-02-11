<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                     <div class="col-lg-8 col-md-8">
                        <div class="header__top__left">
                            <ul class="top-left-list">
                                <li class="email-item">
                                    <i class="fa fa-envelope"></i> info@radix.com.bd
                                </li>
                                <li class="marquee-item">
                                    <div class="marquee">
                                        <span>
                                            🚚 Free Shipping on all orders over $99 — Limited Time Offer!
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
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
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="{{route('home')}}"><img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo.png') }}" alt="" loading="lazy" decoding="async"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="{{route('home')}}">Home</a></li>
                            @foreach ($menus['header_parent'] as $menu)
                            <li><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">{{$menu->name}}@if(isset($menus['header_child'][$menu->id]) && $menus['header_child'][$menu->id]->count() > 0)<span class="arrow_carrot-down">@endif</span></a>
                                @if(isset($menus['header_child'][$menu->id]))
                                  @foreach ($menus['header_child'][$menu->id]->chunk(3) as $chunk)
                                    <ul class="header__menu__dropdown">
                                        @foreach ($chunk as $item)
                                        <li><a href="{{route('category.singleCategoryPage', $item->id)}}">{{ $item->name }}</a></li>
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
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>

                        <a href="{{ route('cart.index') }}" class="cart-icon">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="cart-count">{{ count(session('cart', [])) }}</span>
                        </a>
                        @if (Auth::check())
                        <a class="header-link" href="{{ Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard') }}">
                           <strong> {{ Auth::user()->name }} </strong>
                        </a>
                        @else
                        <a class="header-link" href="{{route('auth.signinPage') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                fill="none">
                                <g clip-path="url(#clip0_3111_32739)">
                                    <path
                                        d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z"
                                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                        stroke-linejoin="round"></path>
                                    <path
                                        d="M20.5901 22C20.5901 18.13 16.7402 15 12.0002 15C7.26015 15 3.41016 18.13 3.41016 22"
                                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                        stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="clip0_3111_32739">
                                        <rect width="24" height="24" fill="white"></rect>
                                    </clipPath>
                                </defs>
                            </svg>
                         
                            <span class="d-sm-inline-block d-none">
                                Sign in
                            </span>
                        </a>
                        @endif
                        <div class="header__cart__price">item: <span>$150.00</span>
                    </div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>