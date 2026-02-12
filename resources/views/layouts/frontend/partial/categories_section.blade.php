 <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    @foreach($menus['left_side'] as $menu)
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="{{ asset($menu->image) }}">
                            <h5><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">{{ $menu->name }}</a></h5>
                        </div>
                    </div>
                    @endforeach
                    
                </div>
            </div>
        </div>
    </section>