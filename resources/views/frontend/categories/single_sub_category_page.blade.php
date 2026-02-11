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
            <!-- END LEFT SIDEBAR -->


            <!-- RIGHT CONTENT -->
            <div class="col-lg-9">
                <div class="category-product-section pb-4">
                    <div class="container">
<div class="section-header mb-3">
                                <h3 class="section-title">
                                    {{ $single_sub_category->name }}
                                </h3>
                            </div>
                        <div class="row">
                            <!-- PRODUCTS -->
                            @if($single_sub_category->products->count()> 0)
                     @foreach($single_sub_category->products as $product)
                    <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat product-card">
                        <div class="featured__item">
                       <a href="{{route('product.details', $product->id)}}"> <div class="featured__item__pic set-bg product-img" data-setbg="{{ asset($product->thumbnail) }}"></a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart  add-to-cart" data-id="{{ $product->id }}"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{route('product.details', $product->id)}}">{{$product->name}} </a></h6>
                            <b>CODE-{{ $product->id }}</b><br>
                            <del>৳{{ number_format($product->sale_price) }}</del>
                            <h5> ৳{{ number_format($product->regular_price) }}</h5>
                            <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="{{ $product->id }}">Add to Cart
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
            </div>
            <!-- END RIGHT CONTENT -->

        </div>
    </div>
</div>
@endsection
