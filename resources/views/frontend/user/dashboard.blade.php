@extends('layouts.frontend.app')

@section('content')
<div class="container py-5">
    <div class="row">

        <!-- SIDEBAR -->
       @include('frontend.user.userSideBar')

        <!-- MAIN CONTENT -->
        <div class="col-lg-9">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="mb-3">👋 Welcome, {{ auth()->user()->name }}</h4>
                    <p class="text-muted">
                        This is your user dashboard. From here you can manage orders,
                        profile and settings.
                    </p>

                    <div class="row g-3 mt-3">
                        <div class="col-md-4">
                            <div class="card text-center">
                                 <a href="{{ route('orders.index') }}">
                                <div class="card-body">
                                    <h5>Orders</h5>
                                    <h3>{{ auth()->user()->orders()->count() }}</h3>
                                </div>
                                 </a>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center">
                                <a href="{{ route('wishlist.index') }}">
                                <div class="card-body">
                                    <h5>Wishlist</h5><h3> {{ auth()->user()->wishlists()->count() }}</h3>
                                </div>
                                </a>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h5>Wallet</h5>
                                    <h3>৳0</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
@endsection
