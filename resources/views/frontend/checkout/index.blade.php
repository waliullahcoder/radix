@extends('layouts.frontend.app')

@section('content')
 <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="{{ route('cart.index') }}">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                @if(!auth()->check()) <h4>Billing Details</h4>@else <h4>Order Details</h4> @endif
                    <form action="{{ route('checkout.placeOrder') }}" method="POST">
                        @csrf
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                 @if(!auth()->check())
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>Full Name<span>*</span></p>
                                        <input type="text" name="name" required>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="email" name="email" required>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>Password<span>*</span></p>
                                        <input type="password" name="password" required>
                                    </div>
                                </div>
                                @endif

                                 <table class="table table-bordered align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Product</th>
                                    <th class="text-center">Qty</th>
                                    <th class="text-end">Price</th>
                                    <th class="text-end">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $subtotal = 0;
                                @endphp

                                @foreach($cart as $item)
                                    @php
                                        $line = $item['price'] * $item['qty'];
                                        $subtotal += $line;
                                    @endphp
                                    <tr>
                                        <td>{{ $item['name'] }}</td>
                                        <td class="text-center">{{ $item['qty'] }}</td>
                                        <td class="text-end">৳ {{ number_format($item['price'],2) }}</td>
                                        <td class="text-end">৳ {{ number_format($line,2) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                           </table>

                            </div>
                            
                            
                        </div>

                         @php
                            $discount = $subtotal * 0.10;
                            $tax = $subtotal * 0.05;
                            $total = $subtotal - $discount + $tax;
                        @endphp
                        <input type="hidden" name="subtotal" value="{{ $subtotal }}">
                        <input type="hidden" name="discount" value="{{ $discount }}">
                        <input type="hidden" name="tax" value="{{ $tax }}">
                        <input type="hidden" name="total" value="{{ $total }}">


                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                
                                <div class="checkout__order__subtotal">Subtotal <span>৳ {{ number_format($subtotal,2) }}</span></div>
                                <ul>
                                    <li>Vegetable’s Package <span>৳ {{ number_format($subtotal,2) }}</span></li>
                                    <li>Discount (10%) <span>- ৳ {{ number_format($discount,2) }}</span></li>
                                    <li>Tax (5%) <span>৳ {{ number_format($tax,2) }}</span></li>
                                </ul>
                                <div class="checkout__order__total">Total <span>৳ {{ number_format($total,2) }}</span></div>
                                
                                <p>If you purchase item no refund but you can exchange the item.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                       Cash on Delivery
                                        <input type="checkbox" name="payment_method" value="Cash" id="payment" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Bkash
                                        <input type="checkbox" name="payment_method" value="Bkash" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                 <div class="checkout__input__checkbox">
                                    <label for="payment">
                                       Rocket
                                        <input type="checkbox" name="payment_method" value="Rocket" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
@endsection
