@extends('layouts.frontend.app')

@section('content')
<div class="container py-5">
    <div class="row">
        @if(count($cart) == 0)
         <div class="d-flex align-items-center justify-content-center">
            <div class="text-center">

                <div class="mb-3">
                    <span style="font-size:60px;">🛒</span>
                </div>

                <h4 class="fw-semibold mb-2">
                    Your cart is empty
                </h4>

                <p class="text-muted mb-3">
                    Looks like you haven’t added anything yet
                </p>

                <a href="{{ url('/') }}" class="btn btn-danger px-4">
                    Continue Shopping
                </a>

            </div>
        </div>
        @endif
        <!-- CART ITEMS -->
        <div class="col-lg-8">
           

            @if(count($cart))
               @foreach($cart as $item)
            <div class="card mb-3 cart-item shadow-sm"
                data-id="{{ $item['id'] }}"
                data-price="{{ $item['price'] }}">

                <div class="card-body">
                    <div class="row align-items-center">

                        <!-- IMAGE -->
                        <div class="col-2 text-center">
                            <img src="{{ asset($item['image']) }}"
                                alt="{{ $item['name'] }}"
                                class="img-fluid rounded"
                                style="max-height:60px">
                        </div>

                        <!-- TITLE + PRICE -->
                        <div class="col-4">
                            <h6 class="mb-1 fw-semibold text-dark">
                                {{ $item['name'] }}
                            </h6>
                            <b>CODE-{{ $item['id'] }}</b>
                            <br>
                            <small class="text-muted">
                                ৳ {{ number_format($item['price'],2) }}
                            </small>
                        </div>

                        <!-- QTY -->
                        <div class="col-3">
                            <div class="d-flex align-items-center justify-content-center">
                                <button type="button"
                                        class="btn btn-sm btn-outline-secondary qty-minus">
                                    −
                                </button>

                                <input type="text"
                                    class="form-control form-control-sm text-center mx-2 qty"
                                    value="{{ $item['qty'] }}"
                                    readonly
                                    style="width:50px">

                                <button type="button"
                                        class="btn btn-sm btn-outline-secondary qty-plus">
                                    +
                                </button>
                            </div>
                        </div>

                        <!-- SUBTOTAL -->
                        <div class="col-2 text-end">
                            <strong class="item-subtotal text-danger">
                                ৳ {{ number_format($item['price'] * $item['qty'],2) }}
                            </strong>
                        </div>

                        <!-- REMOVE -->
                        <div class="col-1 text-end">
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
            @endif
        </div>
       @if(count($cart))
        <!-- SUMMARY -->
        <div class="col-lg-4">
            <div class="card shadow-sm">
                <div class="card-body">

                    <h5 class="mb-3">Order Summary</h5>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Subtotal</span>
                        <strong id="subtotal">৳ 0.00</strong>
                    </div>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Discount (10%)</span>
                        <strong id="discount">- ৳ 0.00</strong>
                    </div>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Tax (5%)</span>
                        <strong id="tax">৳ 0.00</strong>
                    </div>

                    <hr>

                    <div class="d-flex justify-content-between">
                        <strong>Total</strong>
                        <strong id="total">৳ 0.00</strong>
                    </div>

                    <hr>

                    <form action="{{ route('cart.clear') }}" method="POST">
                        @csrf
                        <button class="btn btn-outline-danger w-100 mb-2">
                            Empty Cart
                        </button>
                    </form>

                    <a href="{{ route('checkout') }}" class="btn btn-success w-100">
                        Proceed to Checkout
                    </a>

                </div>
            </div>
        </div>
    @endif
    </div>
</div>
@endsection
