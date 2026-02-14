 <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="{{route('home')}}">
                        <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo.png') }}" 
                             alt="">
                    </a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                        <li>
                            <a href="{{ route('cart.index') }}" class="cart-icon">
                                <i class="fa fa-shopping-bag"></i> 
                                <span class="cart-count">{{ count(session('cart', [])) }}</span>
                            </a>
                        </li>
                    </ul>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="frontend/images/language.png" alt="" fetchpriority="high" decoding="sync">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                @if (Auth::check())
                        <a class="header-link" href="{{ Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard') }}">
                            <strong>{{ Auth::user()->name }}</strong>
                        </a>
                    @else
                        <a href="{{ route('auth.signinPage') }}"><i class="fa fa-user"></i> Login</a>
                    @endif
                
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
             <ul>
                        <li class="active"><a href="{{route('home')}}">Home</a></li>

                        @foreach ($menus['header_parent'] as $menu)
                        <li>
                            <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">
                                {{$menu->name}}
                                <!-- @if(isset($menus['header_child'][$menu->id]) && $menus['header_child'][$menu->id]->count() > 0)
                                    <span class="arrow_carrot-down"></span>
                                @endif -->
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

                        @foreach ($menus['single_page'] as $menu)
                        <li>
                            <a href="{{ route('singleDetails', $menu->category_id) }}">
                                {{$menu->name}}
                            </a>
                        </li>
                        @endforeach

                        <li><a href="{{ route('contactPage') }}">Contact</a></li>
                    </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="{{ $settings->facebook_page ?? '#' }}" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="{{ $settings->twitter ?? '#' }}" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="{{ $settings->linkedin ?? '#' }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                                <a href="{{ $settings->pinterest ?? '#' }}" target="_blank"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> {{ $settings->primary_email ?? 'info@radix.com' }}</li>
                <li>{{ $settings->google_map ?? 'Free Shipping for all Order of $99' }}</li>
            </ul>
        </div>
    </div>