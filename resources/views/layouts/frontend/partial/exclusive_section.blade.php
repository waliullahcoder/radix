<section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Exclusive Collection</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach($menus['left_side'] as $menu)
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="{{ asset($menu->image) }}" alt="" loading="lazy" decoding="async">
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">{{ $menu->name }}</a></h5>
                            <p>{{ $menu->description }} sadasdasdadd</p>
                        </div>
                    </div>
                    </a>
                </div>
                @endforeach
                
                
            </div>
        </div>
    </section>