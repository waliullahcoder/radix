@extends('layouts.frontend.app')

@section('content')


<div class="category-page py-4">
    <div class="container">
        <div class="row">

            <!-- LEFT SIDEBAR -->
           <div class="col-lg-3 col-md-5" style="border:1px solid #e3e7e6;">
                    <div class="sidebar">
                        <div class="hero__categories">
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Colors</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>Popular Size</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Large
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Medium
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Small
                                    <input type="radio" id="small">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        @foreach($featuredProducts as $product)
                                        <a href="{{route('product.details', $product->id)}}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>{{$product->name}}</h6>
                                                <span>৳{{ number_format($product->sale_price) }}</span>
                                            </div>
                                        </a>
                                        @endforeach
                                        
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                         @foreach($featuredProducts as $product)
                                        <a href="{{route('product.details', $product->id)}}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="{{ asset($product->thumbnail) }}" alt="" loading="lazy" decoding="async">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>{{$product->name}}</h6>
                                                <span>৳{{ number_format($product->sale_price) }}</span>
                                            </div>
                                        </a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

           

            <!-- RIGHT CONTENT -->
         <div class="col-lg-9">
        @foreach($subcategories as $sub)
                  <div class="section-header mb-3">
                        <h3 class="section-title">{{$sub->name}}</h3>
                        <a href="{{route('category.singleCategoryPage', $sub->id)}}" class="section-link">See Details</a>
                    </div>
        <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                     @if($sub->products->count()> 0)
                     @foreach($sub->products as $product)
                    <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat product-card">
                        <div class="featured__item">
                       <a href="{{route('product.details', $product->id)}}"> <div class="featured__item__pic set-bg product-img" data-setbg="{{ asset($product->thumbnail) }}"></a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="{{ route('product.details', $product->id) }}"><i class="fa fa-heart"></i></a></li>
                                
                                <li><a href="#"><button class="btn btn-sm btn-danger add-to-cart" data-variant_id="{{ $product->variants[0]->id ?? null }}" data-id="{{ $product->id }}">
                                <i class="fa fa-shopping-cart"></i>
                                </button></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{route('product.details', $product->id)}}">{{$product->name}} </a></h6>
                            <b>CODE-{{ $product->id }}</b><br>
                            
                            <h5><del>৳{{ number_format($product->sale_price) }}</del> ৳{{ number_format($product->regular_price) }}</h5>
                            <button class="btn btn-sm btn-danger add-to-cart"
                            data-variant_id="{{ $product->variants[0]->id ?? null }}"
                                                            data-id="{{ $product->id }}">🛒 Add to Cart ➕ 
                                                        </button>
                        </div>
                        </div>
                    </div>
                    @endforeach
                    @else
                        <p>No subjects</p>
                    @endif
                   
                </div>
            </div>
        </div>
    </section>
    @endforeach

</div>

            <!-- END RIGHT CONTENT -->

        </div>
    </div>
</div>
@endsection
