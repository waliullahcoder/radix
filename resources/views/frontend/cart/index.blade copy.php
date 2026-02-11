@extends('layouts.frontend.app')

@section('content')

<div class="container py-5">

    @if(count($cart) == 0)
        <div class="row justify-content-center">
            <div class="col-lg-6 text-center">
                <div class="mb-4">
                    <span style="font-size:70px;">🛒</span>
                </div>

                <h4 class="fw-semibold mb-2">
                    Your cart is empty
                </h4>

                <p class="text-muted mb-4">
                    Looks like you haven’t added anything yet
                </p>

                <a href="{{ url('/') }}" class="btn btn-danger px-4">
                    Continue Shopping
                </a>
            </div>
        </div>
    @else

    <div class="row">

        <!-- CART ITEMS -->
        <div class="col-lg-8">

            @foreach($cart as $item)
            <div class="card mb-3 cart-item shadow-sm"
                 data-id="{{ $item['id'] }}"
                 data-price="{{ $item['price'] }}">

                <div class="card-body">

                    <div class="row align-items-center text-center text-lg-start" style="border: 1px solid #ebe7e7;margin-top:1px;">

                        <!-- IMAGE -->
                        <div class="col-12 col-lg-2 mb-3 mb-lg-0">
                            <img src="{{ asset($item['image']) }}"
                                 alt="{{ $item['name'] }}"
                                 class="img-fluid rounded"
                                 style="max-height:50px;padding:5px">
                        </div>

                        <!-- PRODUCT INFO -->
                        <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                            <h6 class="fw-semibold mb-1">
                                {{ $item['name'] }}
                            </h6>
                            <small class="text-muted d-block">
                                CODE-{{ $item['id'] }}
                            </small>
                            <small class="text-muted">
                                ৳ {{ number_format($item['price'],2) }}
                            </small>
                        </div>

                        <!-- QUANTITY -->
                        <div class="col-6 col-lg-3 mb-3 mb-lg-0">
                            <div class="d-flex justify-content-center justify-content-lg-start align-items-center">
                                <button type="button"
                                        class="btn btn-sm btn-outline-secondary qty-minus">
                                    −
                                </button>

                                <input type="text"
                                    class="form-control form-control-sm text-center mx-2 qty"
                                    value="{{ $item['qty'] }}"
                                    readonly
                                    style="width:55px">

                                <button type="button"
                                        class="btn btn-sm btn-outline-secondary qty-plus">
                                    +
                                </button>
                            </div>
                        </div>

                        <!-- SUBTOTAL -->
                        <div class="col-4 col-lg-2 mb-3 mb-lg-0" style="padding-top:8px;">
                            <strong class="item-subtotal text-danger">
                                ৳ {{ number_format($item['price'] * $item['qty'],2) }}
                            </strong>
                        </div>

                        <!-- REMOVE -->
                        <div class="col-2 col-lg-1">
                            <form action="{{ route('cart.remove',$item['id']) }}" method="POST">
                                @csrf
                                <button class="btn btn-sm btn-outline-danger">
                                    ✕
                                </button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
            @endforeach

        </div>


        <!-- SUMMARY -->
        <div class="col-lg-4">

            <div class="card shadow-sm">
                <div class="card-body p-4 border rounded-4 shadow-sm bg-white">

    <h5 class="mb-4 fw-bold text-center border-bottom pb-3">
        🧾 Order Summary
    </h5>

    <!-- Subtotal -->
    <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
        <span class="text-muted">Subtotal</span>
        <strong id="subtotal" class="text-dark">৳ 0.00</strong>
    </div>

    <!-- Discount -->
    <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
        <span class="text-muted">Discount (10%)</span>
        <strong id="discount" class="text-danger">- ৳ 0.00</strong>
    </div>

    <!-- Tax -->
    <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
        <span class="text-muted">Tax (5%)</span>
        <strong id="tax" class="text-dark">৳ 0.00</strong>
    </div>

    <!-- Total -->
    <div class="d-flex justify-content-between align-items-center py-3 mt-2 border rounded-3 px-3 bg-light">
        <strong class="fs-5">Total</strong>
        <strong id="total" class="fs-5 text-success">৳ 0.00</strong>
    </div>

    <!-- Buttons -->
    <div class="mt-4">

        <form action="{{ route('cart.clear') }}" method="POST">
            @csrf
            <button class="btn btn-outline-danger w-100 mb-3 rounded-3">
                🗑 Empty Cart
            </button>
        </form>

        <a href="{{ route('checkout') }}" 
           class="btn btn-success w-100 rounded-3 fw-semibold">
            ✔ Proceed to Checkout
        </a>

    </div>

</div>

            </div>

        </div>

    </div>

    @endif

</div>

@endsection
