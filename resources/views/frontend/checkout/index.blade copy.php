@extends('layouts.frontend.app')

@section('content')
<div class="container">
    <form action="{{ route('checkout.placeOrder') }}" method="POST">
        @csrf

        <div class="row">

            {{-- LEFT : CART / INVOICE --}}
            <div class="col-lg-8">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">

                        <h4 class="mb-3">🧾 Order Summary</h4>

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
                       
                        @php
                            $discount = $subtotal * 0.10;
                            $tax = $subtotal * 0.05;
                            $total = $subtotal - $discount + $tax;
                        @endphp
                        <input type="hidden" name="subtotal" value="{{ $subtotal }}">
                        <input type="hidden" name="discount" value="{{ $discount }}">
                        <input type="hidden" name="tax" value="{{ $tax }}">
                        <input type="hidden" name="total" value="{{ $total }}">
                        <ul class="list-group mt-3">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Subtotal</span>
                                <strong>৳ {{ number_format($subtotal,2) }}</strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Discount (10%)</span>
                                <strong class="text-danger">
                                    - ৳ {{ number_format($discount,2) }}
                                </strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Tax (5%)</span>
                                <strong>৳ {{ number_format($tax,2) }}</strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between fs-5">
                                <strong>Total</strong>
                                <strong>৳ {{ number_format($total,2) }}</strong>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>

            {{-- RIGHT : CUSTOMER + PAYMENT --}}
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body">

                        {{-- CUSTOMER INFO --}}
                        @if(!auth()->check())
                            <h5 class="mb-3">👤 Customer Information</h5>

                            <div class="mb-2">
                                <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                            </div>

                            <div class="mb-2">
                                <input type="email" name="email" class="form-control" placeholder="Email" required>
                            </div>

                            <div class="mb-3">
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                            </div>
                        @endif

                        {{-- PAYMENT METHOD --}}
                        <h5 class="mb-3">💳 Payment Method</h5>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="payment_method" value="cod" checked>
                            <label class="form-check-label">
                                Cash on Delivery (COD)
                            </label>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="payment_method" value="bkash">
                            <label class="form-check-label">
                                bKash
                            </label>
                        </div>

                        <div class="form-check mb-4">
                            <input class="form-check-input" type="radio" name="payment_method" value="rocket">
                            <label class="form-check-label">
                                Rocket
                            </label>
                        </div>

                        {{-- PLACE ORDER --}}
                        <button type="submit" class="btn btn-danger w-100 btn-lg">
                            🛒 Place Order
                        </button>

                    </div>
                </div>
            </div>

        </div>
    </form>
</div>
@endsection
