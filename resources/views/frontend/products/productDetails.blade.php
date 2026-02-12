

@extends('layouts.frontend.app')

@section('content')
<style>
        .container { margin-bottom:20px;}
        
        /* Flex Layout */
        .product-wrapper { display: flex; flex-wrap: wrap; gap: 40px; }
        .product-image-side { flex: 1; min-width: 300px; }
        .product-info-side { flex: 1; min-width: 300px; }

        /* Image Slider Area */
        .main-img { width: 100%; border-radius: 10px; cursor: crosshair; transition: 0.3s; }
        .thumb-group { display: flex; gap: 10px; margin-top: 15px; }
        .thumb { width: 80px; height: 80px; border-radius: 5px; cursor: pointer; border: 2px solid transparent; transition: 0.3s; }
        .thumb:hover, .thumb.active { border-color: #ff4757; }

        /* Product Details */
        .badge { background: #ff4757; color: #fff; padding: 4px 10px; border-radius: 5px; font-size: 12px; }
        .title { font-size: 28px; margin: 15px 0 10px; color: #2f3542; }
        .price-tag { font-size: 24px; color: #ff4757; font-weight: bold; margin-bottom: 20px; }
        .description { color: #747d8c; line-height: 1.6; margin-bottom: 25px; }

        /* Actions */
        .action-area { display: flex; gap: 15px; align-items: center; margin-bottom: 30px; }
        .qty-input { width: 60px; padding: 10px; border: 1px solid #ddd; border-radius: 5px; text-align: center; }
        .add-btn { background: #2f3542; color: white; border: none; padding: 12px 30px; border-radius: 5px; cursor: pointer; font-weight: bold; flex-grow: 1; transition: 0.3s; }
        .add-btn:hover { background: #000; }

        /* Tabs Section */
        .tab-section { margin-top: 50px; border-top: 1px solid #eee; padding-top: 30px; }
        .tab-nav { display: flex; gap: 30px; border-bottom: 2px solid #eee; margin-bottom: 20px; }
        .tab-link { padding-bottom: 10px; cursor: pointer; color: #747d8c; font-weight: 600; }
        .tab-link.active { color: #ff4757; border-bottom: 2px solid #ff4757; }
        .tab-pane { display: none; line-height: 1.8; color: #57606f; }
        .tab-pane.active { display: block; }

        @media (max-width: 768px) { .product-wrapper { flex-direction: column; } }
    </style>

    <div class="container">
    <div class="product-wrapper product-card">
        
        <div class="product-image-side">
            <img class="product-img" src="{{ asset($product->thumbnail) }}" id="mainImage" class="main-img" alt="Product">
            <div class="thumb-group">
                <img src="{{ asset($product->thumbnail) }}" class="thumb active" onclick="changeImage(this.src, this)">
                @if(isset($product->images[0]))
                <img src="{{ asset($product->images[0]->image) }}" class="thumb active" onclick="changeImage(this.src, this)">
                @endif
                @if(isset($product->images[1]))
                <img src="{{ asset($product->images[1]->image) }}" class="thumb" onclick="changeImage(this.src, this)">
                @endif
                @if(isset($product->images[2]))
                <img src="{{ asset($product->images[2]->image) }}" class="thumb" onclick="changeImage(this.src, this)">
                @endif
                @if(isset($product->images[3]))
                <img src="{{ asset($product->images[3]->image) }}" class="thumb" onclick="changeImage(this.src, this)">
                @endif
            </div>
        </div>

        <div class="product-info-side">
            <span class="badge">New Arrival</span>
            <h1 class="title">{{ $product->name }}</h1>

            <div class="product__details__option">
                <div class="size-wrapper">
                    <span class="label-title">Size:</span>

                    <div class="size-option">
                        <input type="radio" id="size-xl" name="size" value="XL" checked>
                        <label for="size-xl">XL</label>
                    </div>

                    <div class="size-option">
                        <input type="radio" id="size-xxl" name="size" value="XXL">
                        <label for="size-xxl">XXL</label>
                    </div>

                    <div class="size-option">
                        <input type="radio" id="size-l" name="size" value="L">
                        <label for="size-l">L</label>
                    </div>

                    <div class="size-option">
                        <input type="radio" id="size-m" name="size" value="M">
                        <label for="size-m">M</label>
                    </div>

                    <div class="size-option">
                        <input type="radio" id="size-s" name="size" value="S">
                        <label for="size-s">S</label>
                    </div>
                </div>
            </div>


            <div class="price-tag"><del>৳{{ number_format($product->regular_price) }} </del> ৳{{ number_format($product->sale_price) }} ৳</div>
            <p class="description">{!! $product->short_description !!} </p>
            
            <div class="action-area">
                @php
                    $alreadyWishlisted = auth()->check() &&
                    auth()->user()->wishlists()->where('product_id', $product->id)->exists();
                @endphp
                                    @if($alreadyWishlisted)
                                        <button class="btn btn-sm btn-danger" disabled>
                                            ❤️ Wishlisted
                                        </button>
                                    @else
                                        <form action="{{ route('wishlist.store', $product->id) }}"
                                            method="POST"
                                            class="d-inline">
                                            @csrf
                                            <button class="btn btn-outline-danger btn-sm">
                                                🤍 Add to Wishlist
                                            </button>
                                        </form>
                                    @endif
               
                <button class="add-btn add-to-cart" data-id="{{ $product->id }}">Add to Cart</button>
            </div>

            <p><strong>Category:</strong> Electronics, Audio</p>
            <p><strong>Availability:</strong> In Stock</p>
        </div>
    </div>

    <div class="tab-section">
        <div class="tab-nav">
            <div class="tab-link active" onclick="switchTab(event, 'details')">Description</div>
            <div class="tab-link" onclick="switchTab(event, 'spec')">Specifications</div>
            <div class="tab-link" onclick="switchTab(event, 'reviews')">Reviews (12)</div>
        </div>

        <div id="details" class="tab-pane active">
            <p>Ekhane product er bistarito bivoron thakbe. Design ti khub e clean rakha hoyeche jate user er prochondo sahajjo hoy.</p>
        </div>
        <div id="spec" class="tab-pane">
            <ul>
                <li>Battery Life: 40 Hours</li>
                <li>Bluetooth: 5.2 Version</li>
                <li>Weight: 250g</li>
            </ul>
        </div>
        <div id="reviews" class="tab-pane">
            <p>Customer reviews ebong ratings ekhane show kora hobe.</p>
        </div>
    </div>
</div>

<script>
    // Image Switcher Logic
    function changeImage(src, el) {
        document.getElementById('mainImage').src = src;
        document.querySelectorAll('.thumb').forEach(t => t.classList.remove('active'));
        el.classList.add('active');
    }

    // Tab Switcher Logic
    function switchTab(e, tabId) {
        document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.tab-link').forEach(l => l.classList.remove('active'));
        
        document.getElementById(tabId).classList.add('active');
        e.currentTarget.classList.add('active');
    }
</script>



@endsection
