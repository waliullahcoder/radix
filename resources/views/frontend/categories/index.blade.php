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
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                
                                <li><a href="#"><button class="btn btn-sm btn-danger add-to-cart" data-id="{{ $product->id }}">
                                <i class="fa fa-shopping-cart"></i>
                                </button></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{route('product.details', $product->id)}}">{{$product->name}} </a></h6>
                            <b>CODE-{{ $product->id }}</b><br>
                            
                            <h5><del>৳{{ number_format($product->sale_price) }}</del> ৳{{ number_format($product->regular_price) }}</h5>
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
    </section>
    @endforeach

</div>

            <!-- END RIGHT CONTENT -->

        </div>
    </div>
</div>
@endsection
