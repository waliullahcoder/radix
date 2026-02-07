@extends('layouts.admin.index_app')


@section('content')
<div class="container py-5">
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow-sm">
                <div class="card-body">

                    <div class="d-flex justify-content-between mb-3">
                        <h5>Order #{{ $order->order_number }}</h5>
                        <a href="{{ route('admin.orders.invoice', $order) }}"
                           class="btn btn-sm btn-outline-primary">
                            📄 Download Invoice
                        </a>
                    </div>

                    {{-- STATUS TRACK --}}
                    <ul class="order-tracker mb-4">
                        <li class="{{ in_array($order->status,['pending','processing','completed']) ? 'active' : '' }}">Pending</li>
                        <li class="{{ in_array($order->status,['processing','completed']) ? 'active' : '' }}">Processing</li>
                        <li class="{{ $order->status=='completed' ? 'active' : '' }}">Completed</li>
                    </ul>

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Variant</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($order->items as $item)
                                <tr>
                                    <td>{{ $item->product->name }}</td>
                                    <td>
                                        {{ optional($item->productVariant)->name ?? '-' }}
                                    </td>
                                    <td>{{ $item->qty }}</td>
                                    <td>৳ {{ number_format($item->price,2) }}</td>
                                    <td>৳ {{ number_format($item->total,2) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="text-end mt-3">
                        <h5>Grand Total: ৳ {{ number_format($order->total,2) }}</h5>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
