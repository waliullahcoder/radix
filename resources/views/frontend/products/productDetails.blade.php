

@extends('layouts.frontend.app')

@section('content')
 <!-- Product Details Section Begin -->
<section class="product-details spad product-card">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large product-img" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            @if(isset($product->thumbnail))
                            <img data-imgbigurl="{{ asset($product->thumbnail) }}" src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                            @endif
                           
                            @foreach ($product->images as $item)
                            <img data-imgbigurl="{{ asset($item->image) }}" src="{{ asset($item->image) }}" alt="" loading="lazy" decoding="async">
                            @endforeach
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>{{ $product->name }}</h3>
                        <h4 class="title">CODE-{{ $product->id }}</h4>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__option">
                            <div class="size-wrapper">
                                <span class="label-title">Size:</span>
                                @foreach ($product->variants as $variant)
                                @php
                                    $id = 'size-'.$variant->variant ?? 'NA';
                                @endphp
                                <div class="size-option">
                                    <input type="radio" id="{{ $id }}" name="variant_id" value="{{ $variant->id }}">
                                    <label for="{{ $id }}">{{ $variant->size ?? 'NA' }}</label>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="product__details__price"><del>৳{{ number_format($product->regular_price) }} </del> ৳{{ number_format($product->sale_price) }}</div>
                        <p>{!! $product->short_description !!}</p>
                        <!-- <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div> -->
                        <a href="#" class="primary-btn add-to-cart" data-variant_id="{{ $product->variants[0]->id ?? null }}" data-id="{{ $product->id }}">ADD TO CARD</a>
                        @php
                    $alreadyWishlisted = auth()->check() &&
                    auth()->user()->wishlists()->where('product_id', $product->id)->exists();
                @endphp
                                    @if($alreadyWishlisted)
                                        <button class="heart-icon" disabled>
                                            <span class="icon_heart_alt"></span> Wishlisted
                                        </button>
                                    @else
                                        <form action="{{ route('wishlist.store', $product->id) }}"
                                            method="POST"
                                            class="d-inline">
                                            @csrf
                                            <button class="heart-icon">
                                               <span class="icon_heart_alt"></span> Add to Wishlist
                                            </button>
                                        </form>
                                    @endif
                        <!-- <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a> -->
                        <ul>
                            <li><b>Availability</b> <span>{{ $product->variants[0]['stock'] &&  $product->variants[0]['stock'] >0 ? 'In Stock' : 'Out Stock' }}</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Quantity</b> <span>{{ $product->variants[0]['stock']  &&  $product->variants[0]['stock'] >0 ? $product->variants[0]['stock'] : '0' }}</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                   
                            <a href="{{ $settings->instagram ?? '#' }}" target="_blank"><i class="fa fa-instagram"></i></a>
                            <a href="{{ $settings->twitter ?? '#' }}" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="{{ $settings->pinterest ?? '#' }}" target="_blank"><i class="fa fa-pinterest"></i></a>
                            <a href="{{ $settings->linkedin ?? '#' }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>{!! $product->description !!}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>{!! $product->short_description !!}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->



@endsection
