@extends('layouts.frontend.appHome')

@section('content')
       <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                @foreach($latests as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                    </div>
                                </a>
                                @endforeach
                               
                            </div>
                            <div class="latest-prdouct__slider__item">
                                @foreach($latests as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                    </div>
                                </a>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                                
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                @foreach($toprated as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                    @php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     @endphp
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                    </div>
                                </a>
                                @endforeach
                            </div>
                            <div class="latest-prdouct__slider__item">
                                @foreach($toprated as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                            @php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     @endphp
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                    </div>
                                </a>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                               @foreach($reviewedproducts as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                        
                                   

                                    <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                        @php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     @endphp
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                
                                    </div>
                                </a>
                                @endforeach
                            </div>
                            <div class="latest-prdouct__slider__item">
                               @foreach($reviewedproducts as $product)
                                <a href="{{ route('product.details', $product->id) }}" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>{{ $product->name }}</h6>
                                        <span>৳{{ number_format($product->sale_price) }}</span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                            @php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     @endphp
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                    </div>
                                </a>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
