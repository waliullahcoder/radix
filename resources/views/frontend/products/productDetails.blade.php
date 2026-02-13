

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
                           @if(isset($product->images) && !empty($product->images))
                            @foreach ($product->images as $item)
                            <img data-imgbigurl="{{ asset($item->image) }}" src="{{ asset($item->image) }}" alt="" loading="lazy" decoding="async">
                            @endforeach
                            @endif
                            
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
                                @if($product->variants->count() > 0)
                                @foreach ($product->variants as $variant)
                                @php
                                    $id = 'size-'.$variant->variant ?? 'NA';
                                @endphp
                                <div class="size-option">
                                    <input type="radio" id="{{ $id }}" name="variant_id" value="{{ $variant->id }}">
                                    <label for="{{ $id }}">{{ $variant->size ?? 'NA' }}</label>
                                </div>
                                @endforeach
                                @endif
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
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" aria-selected="false">Reviews <span>({{ $product->reviews->count() }})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Description</h6>
                                    <p>{!! $product->description !!}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <table class="table table-bordered">
                                <tr>
                                    <th>Category ID</th>
                                    <td>{{ $product->category_id }}</td>
                                </tr>
                                <tr>
                                    <th>Brand ID</th>
                                    <td>{{ $product->brand_id }}</td>
                                </tr>
                                <tr>
                                    <th>Publication</th>
                                    <td>{{ $product->publication_id }}</td>
                                </tr>
                                <tr>
                                    <th>Barcode</th>
                                    <td>{{ $product->barcode }}</td>
                                </tr>
                            </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Review</h6>
                                    <h6 class="mb-3">
                                        Customer Reviews ({{ $product->reviews->count() }})
                                    </h6>
                                    @forelse($product->reviews as $review)
                                        <div class="border-bottom pb-2 mb-3">
                                            <strong>{{ $review->user->name }}</strong>

                                            <div class="text-warning review-rating">
                                                @for($i=1;$i<=5;$i++)
                                                    {{ $i <= $review->rating ? '★' : '☆' }}
                                                @endfor
                                            </div>

                                            <p class="mb-0 text-muted">
                                                {{ $review->review }}
                                            </p>
                                        </div>
                                    @empty
                                        <p class="text-muted">No reviews yet.</p>
                                    @endforelse

                                    {{-- REVIEW FORM --}}
                                    @auth
                                        <hr>
                                        <h6>Write a Review</h6>

                                        <style>
                                        .review-box {
                                            background: #ffffff;
                                            padding: 30px;
                                            border-radius: 15px;
                                            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
                                        }

                                        .review-box h5 {
                                            font-weight: 600;
                                            margin-bottom: 20px;
                                        }

                                        .star-rating {
                                            direction: rtl;
                                            display: inline-flex;
                                        }

                                        .star-rating input {
                                            display: none;
                                        }

                                        .star-rating label {
                                            font-size: 28px;
                                            color: #ddd;
                                            cursor: pointer;
                                            transition: 0.3s;
                                        }

                                        .star-rating input:checked ~ label,
                                        .star-rating label:hover,
                                        .star-rating label:hover ~ label {
                                            color: #ffc107;
                                        }

                                        .review-box textarea {
                                            border-radius: 10px;
                                            resize: none;
                                        }

                                        .review-btn {
                                            background: linear-gradient(45deg, #ff6a00, #ffb347);
                                            border: none;
                                            padding: 10px 25px;
                                            border-radius: 30px;
                                            color: #fff;
                                            font-weight: 600;
                                            transition: 0.3s;
                                        }

                                        .review-btn:hover {
                                            opacity: 0.9;
                                            transform: translateY(-2px);
                                        }
                                        </style>


                                        <div class="review-box mt-4">
                                            <h5>Write a Review</h5>

                                            <form method="POST" action="{{ route('review.store', $product->id) }}">
                                                @csrf

                                                {{-- Star Rating --}}
                                                <div class="mb-3">
                                                    <label class="form-label d-block mb-2">Your Rating</label>

                                                    <div class="star-rating">
                                                        @for($i=5;$i>=1;$i--)
                                                            <input type="radio" id="star{{ $i }}" name="rating" value="{{ $i }}" required/>
                                                            <label for="star{{ $i }}">★</label>
                                                        @endfor
                                                    </div>
                                                </div>

                                                {{-- Review Text --}}
                                                <div class="mb-3">
                                                    <label class="form-label">Your Review</label>
                                                    <textarea name="review"
                                                    rows="6"
                                                    class="form-control"
                                                    style="width:100%; min-height:150px; padding:10px"
                                                    placeholder="Share your experience about this product..."></textarea>

                                                </div>

                                                <button type="submit" class="review-btn">
                                                    Submit Review
                                                </button>
                                            </form>
                                        </div>

                                    @else
                                        <p class="text-muted mt-3">
                                            Please <a href="{{ route('login') }}">login</a> to write a review.
                                        </p>
                                    @endauth
                                    
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
