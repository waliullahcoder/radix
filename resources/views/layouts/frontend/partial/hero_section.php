
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            @foreach($menus['header_parent'] as $menu)
                            <li><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">{{$menu->name}}</a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Items Search
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+8801617-475475</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="frontend/images/banner-1.png">
                        <div class="hero__text">
                           <span>MOJA FACTORY</span>
                            <h2>Stylish <br>100% Trendy</h2>
                            <p>Fresh Designs • Comfy Fabric • Everyday Moja</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
 