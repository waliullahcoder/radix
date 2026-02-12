<section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 featured__controls">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                @foreach($featuredProducts as $product)
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat product-card">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg product-img" data-setbg="{{ asset($product->thumbnail) }}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="{{ route('product.details', $product->id) }}"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart  add-to-cart" data-variant_id="{{ $product->variants[0]->id ?? null }}" data-id="{{ $product->id }}"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{ route('product.details', $product->id) }}">{{ $product->name }} (CODE-{{ $product->id }})</a></h6>
                            <h5><del>৳{{ number_format($product->sale_price) }}</del> ৳{{ number_format($product->sale_price) }}</h5>
                        </div>
                    </div>
                </div>
                @endforeach
               
            </div>
        </div>
    </section>