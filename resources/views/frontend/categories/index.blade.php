@extends('layouts.frontend.app')

@section('content')
<div class="category-page py-4">
    <div class="container">
        <div class="row">

            <!-- LEFT SIDEBAR -->
            <div class="col-lg-3 d-none d-lg-block">
                <div class="filter-box">
                    <h5 class="filter-title">ফিল্টার</h5>
                    <!-- SUBJECT -->
                    <div class="filter-group">
                        <h6>বিষয়</h6>
                        <ul>
                            @foreach($subcategories as $sub)
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        {{ $sub->name }}
                                    </label>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <!-- AUTHOR -->
                    <div class="filter-group">
                        <h6>লেখক</h6>
                        <ul>
                            @foreach($authors ?? [] as $author)
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        {{ $author->name }}
                                    </label>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="filter-group">
                        <h6>পাবলিকেশন</h6>
                        <ul>
                            @foreach($publications ?? [] as $pub)
                                <li>
                                    <label>
                                        <input type="checkbox">
                                        {{ $pub->name }}
                                    </label>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="filter-group">
                        <h6>দাম অনুযায়ী</h6>

                        <!-- SORT -->
                        <ul class="mb-3">
                            <li>
                                <label>
                                    <input type="radio" name="price_sort"
                                        value="low_high"
                                        onchange="this.form.submit()"
                                        {{ request('price_sort') == 'low_high' ? 'checked' : '' }}>
                                    কম থেকে বেশি
                                </label>
                            </li>
                            <li>
                                <label>
                                    <input type="radio" name="price_sort"
                                        value="high_low"
                                        onchange="this.form.submit()"
                                        {{ request('price_sort') == 'high_low' ? 'checked' : '' }}>
                                    বেশি থেকে কম
                                </label>
                            </li>
                        </ul>

                        <!-- RANGE -->
                        <ul>
                            <li>
                                <label>
                                    <input type="radio" name="price_range"
                                        value="0-200"
                                        onchange="this.form.submit()"
                                        {{ request('price_range') == '0-200' ? 'checked' : '' }}>
                                    ০ – ২০০ ৳
                                </label>
                            </li>
                            <li>
                                <label>
                                    <input type="radio" name="price_range"
                                        value="201-500"
                                        onchange="this.form.submit()"
                                        {{ request('price_range') == '201-500' ? 'checked' : '' }}>
                                    ২০১ – ৫০০ ৳
                                </label>
                            </li>
                            <li>
                                <label>
                                    <input type="radio" name="price_range"
                                        value="500+"
                                        onchange="this.form.submit()"
                                        {{ request('price_range') == '500+' ? 'checked' : '' }}>
                                    ৫০০+ ৳
                                </label>
                            </li>
                        </ul>
                    </div>

                    <!-- PRICE -->
                    <div class="filter-group">
                        <h6>দাম</h6>
                        <ul>
                            <li><label><input type="checkbox"> ০ – ২০০ ৳</label></li>
                            <li><label><input type="checkbox"> ২০১ – ৫০০ ৳</label></li>
                            <li><label><input type="checkbox"> ৫০০+ ৳</label></li>
                        </ul>
                    </div>
                </div>
            </div>

           

            <!-- RIGHT CONTENT -->
         <div class="col-lg-9">
    <div class="category-product-section pb-4">
       
        <div class="container">
             @foreach($subcategories as $sub)
                <div class="section-card">
                    <!-- Section Header -->
                    <div class="section-header mb-3">
                        <h3 class="section-title">{{$sub->name}}</h3>
                        <a href="{{route('category.singleCategoryPage', $sub->id)}}" class="section-link">সবগুলো দেখুন</a>
                    </div>

                    <div class="position-relative">
                        <!-- Swiper -->
                        <div class="swiper carousel"
                             data-items="2"
                             data-xl-items="6"
                             data-lg-items="4"
                             data-md-items="4"
                             data-sm-items="3"
                             data-xs-items="2"
                             data-margin="4"
                             data-dots="false"
                             data-arrows="true">

                            <div class="swiper-wrapper">

                                <!-- Product Slide -->
                              @if($sub->products->count()> 0)
                               @foreach($sub->products as $product)
                                <div class="swiper-slide">
                                    <div class="p-sm-2 p-1">
                                        <div class="product-card-wrapper">
                                            <div class="product-card">

                                                <div class="discount-badge">
                                                    <span class="product-discount">{{number_format($product->discount)}}</span>
                                                </div>
                                        <a class="z-2" href="{{route('product.details', $product->id)}}">
                                                <figure class="product-card-image ratio" style="--bs-aspect-ratio: 130%">
                                                  
                                                    <img class="object-fit-contain product-img"
                                                        src="{{ asset($product->thumbnail) }}"
                                                         alt="">
                                                </figure>

                                                <div class="product-card-content">
                                                    <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                      
                                                         {{$product->name}}
                                                    </h6>
                                                    <b class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                        CODE-{{ $product->id }}
                                                    </b>
                                                    <span class="product-card-price">
                                                        <del>
                                                            <span class="Price-amount">
                                                                 {{ number_format($product->sale_price, 2) }} <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                        </del>
                                                          
                                                        <ins>
                                                            <span class="Price-amount">
                                                                 {{ number_format($product->regular_price, 2) }} <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                        </ins>
                                                    </span>
                                                </div>
                                                </a>
                                                <div class="product-card-action">
                                                   <button class="btn btn-sm btn-danger add-to-cart"
                                                        data-variant_id="{{ $product->variants[0]->id ?? null }}"
                                                        data-id="{{ $product->id }}">
                                                    Add to Cart
                                                </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                               @endforeach
                                @else
                                    <p>No subjects</p>
                                @endif
                                <!-- Product Slide -->
                           

                            </div>

                            <!-- Swiper Arrows -->
                           <div class="swiper-arrow-btn swiper-button-prev" data-target="#category-swiper">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div>
                    <div class="swiper-arrow-btn swiper-button-next" data-target="#category-swiper">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div>

                        </div>
                        <!-- End Swiper -->

                    </div>
                </div>
              @endforeach

        </div>
        
    </div>
</div>

            <!-- END RIGHT CONTENT -->

        </div>
    </div>
</div>
@endsection
