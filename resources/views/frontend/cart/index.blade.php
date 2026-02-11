@extends('layouts.frontend.app')

@section('content')
 <!-- Shoping Cart Section Begin -->
    @if(count($cart) > 0)
  <div class="row justify-content-center">
                <div class="col-lg-12 text-center">
                    <h4 class="fw-semibold mb-2">🧾 Order Summary</h4>
                </div>
        </div>
    @endif
    <section class="shoping-cart spad">
        <div class="container">

        
        @if(count($cart) === 0)
            <div class="row justify-content-center">
                <div class="col-lg-12 text-center">
                    <div class="mb-4">
                        <span style="font-size:70px;">🛒</span>
                    </div>
                    <h4 class="fw-semibold mb-2">Your cart is empty</h4>
                    <p class="text-muted mb-4">Looks like you haven’t added anything yet.</p>
                    <a href="{{ url('/') }}" class="primary-btn">CONTINUE SHOPPING</a>
                </div>
            </div>
        @else
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                 @foreach($cart as $item)
                                <tr class="card mb-3 cart-item shadow-sm"
                 data-id="{{ $item['id'] }}"
                 data-price="{{ $item['price'] }}">
                                    <td class="shoping__cart__item">
                                        <!-- <img src="{{ asset($item['image']) }}" alt="" loading="lazy" decoding="async"> -->
                                         <img src="{{ asset($item['image']) }}"
                                 alt="{{ $item['name'] }}"
                                 class="img-fluid rounded"
                                 style="max-height:50px;padding:5px" loading="lazy" decoding="async">
                                        <h5>{{ $item['name'] }} (CODE-{{ $item['id'] }})</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                          ৳ {{ number_format($item['price'],2) }}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                       
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
                                    </td>
                                    <td class="shoping__cart__total">
                                       <strong class="item-subtotal text-danger">
                                ৳ {{ number_format($item['price'] * $item['qty'],2) }}
                            </strong>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <form action="{{ route('cart.remove',$item['id']) }}" method="POST">
                                @csrf
                                <button class="btn btn-sm btn-outline-danger">
                                     <span class="icon_close"></span>
                                </button>
                            </form>
                                       
                                    </td>
                                </tr>
                                @endforeach
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>

                        <form action="{{ route('cart.clear') }}" method="POST">
                            @csrf
                            <button class="primary-btn cart-btn cart-btn-right">
                                🗑 Remove Cart
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span id="subtotal">৳ 0.00</span></li>
                            <li>Discount (10%) <span id="discount">-৳ 0.00</span></li>
                            <li>Tax (5%) <span id="tax">৳ 0.00</span></li>
                            <li>Total <span id="total">৳ 0.00</span></li>
                        </ul>
                         
                        <a href="{{ route('checkout') }}" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
            
      @endif
        </div>
    </section>
    <!-- Shoping Cart Section End -->
@endsection
