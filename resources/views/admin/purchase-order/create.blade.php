@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-8">
            <div class="collapse" id="gridCollapse">
                <div class="card border-dashed mb-2 position-relative">
                    <div class="card-body">
                        <div class="spinner" id="grid-loader" style="display: none;">
                            <div class="rect1"></div>
                            <div class="rect2"></div>
                            <div class="rect3"></div>
                        </div>

                        <div class="text-center">
                            <div id="gridSelection" class="btn-group" role="group">
                                <a href="javascript:void(0);" class="btn btn-sm btn-primary grid-button active"
                                    data-type="byCategory"
                                    style="max-width: min-content; min-width: 70px !important;">Categories</a>
                                <a href="javascript:void(0);" class="btn btn-sm btn-primary grid-button" data-type="byTag"
                                    style="max-width: min-content; min-width: 70px !important;">Tags</a>
                                <a href="javascript:void(0);" class="btn btn-sm btn-primary grid-button"
                                    data-type="byVendor"
                                    style="max-width: min-content; min-width: 70px !important;">Suppliers</a>
                                <a href="javascript:void(0);" class="btn btn-sm btn-primary grid-button"
                                    data-type="byFavorite"
                                    style="max-width: min-content; min-width: 70px !important;">Favorites</a>
                            </div>
                        </div>
                        <div class="grid-container" id="gridContainer">
                            @include('admin.purchase-order.partial.grid', [
                                'categories' => \App\Models\Category::root()->where('status', true)->get(),
                                'products' => collect(),
                            ])
                        </div>
                    </div>
                </div>
            </div>

            <div class="card border-dashed mb-2">
                <div class="card-body">
                    <div class="input-group add-payment-form">
                        <a class="btn btn-sm btn-secondary px-3" href="{{ Route('admin.product.create') }}">
                            <i class="fas fa-plus"></i>
                        </a>
                        <input type="text" class="form-control" placeholder="Enter item name or scan barcode">
                        <button class="btn btn-sm btn-secondary" id="collapseBtn" type="button" data-bs-toggle="collapse"
                            href="#gridCollapse" role="button" aria-expanded="false" aria-controls="gridCollapse"> Show
                            Grid</button>
                    </div>
                </div>
            </div>

            <div class="card border-dashed paper-cut">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr class="register-items-header text-nowrap">
                                    <th><a href="javascript:void(0);" id="sale_details_expand_collapse" class="expand">-</a>
                                    </th>
                                    <th class="item_sort_able item_name_heading ">Item Name</th>
                                    <th class="item_sort_able sales_price ">Cost</th>
                                    <th class="item_sort_able sales_quantity ">Qty.</th>
                                    <th class="item_sort_able sales_discount ">Disc %</th>
                                    <th class="item_sort_able sales_total ">Total</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="row g-2">
                <div class="col-12">
                    <div class="card border-dashed">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="vendor_id" class="form-label"><b>Supplier <span class="text-danger">*</span></b></label>
                                    <select name="vendor_id" id="vendor_id" class="form-select select"
                                        data-placeholder="Select Supplier" required>
                                        <option value=""></option>
                                        @foreach ($vendors as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label for="store_id" class="form-label"><b>Store</b></label>
                                    <select name="store_id" id="store_id" class="form-select select"
                                        data-placeholder="Select Store">
                                        <option value=""></option>
                                        @foreach ($stores as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label for="order_date" class="form-label"><b>Order Date</b></label>
                                    <input type="text" name="order_date" class="form-control date_picker"
                                        value="{{ date('d-m-Y') }}" required>
                                </div>

                                <div class="col-12">
                                    <label for="expected_date" class="form-label"><b>Expected Date</b></label>
                                    <input type="text" name="expected_date" class="form-control date_picker"
                                        value="{{ date('d-m-Y') }}" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card border-dashed paper-cut">
                        <div class="card-body p-0">
                            <ul class="list-group rounded-0" style="margin: -1px;">
                                <li class="list-group-item border-dashed">
                                    <span class="key">Discount all Items by Percent: </span>
                                    <span class="value  float-end">
                                        <a href="#" id="discount_all_percent"
                                            class="xeditable editable editable-click editable-empty"
                                            data-emptytext="Set Discount" data-placeholder="Set Discount">Set Discount</a>
                                    </span>
                                </li>
                                <li class="list-group-item border-dashed">
                                    <span class="key">Discount Entire Sale: </span>
                                    <span class="value  float-end">
                                        <span id="TEST"></span>
                                        <a href="#" id="discount_all_flat"
                                            class="xeditable editable editable-click editable-empty"
                                            data-url="https://demo.phppointofsale.com/index.php/sales/discount_all"
                                            data-title="Discount Entire Sale" data-emptytext="Set Discount"
                                            data-placeholder="Set Discount (% or fixed)">Set Discount</a>

                                    </span>
                                </li>
                                <li class="sub-total list-group-item border-dashed">
                                    <span class="key">Sub Total:</span>
                                    <span class="value float-end">
                                        <span id="subtotal">৳450.00</span>
                                    </span>
                                </li>
                                <li class="list-group-item border-dashed">
                                    <span class="key">
                                        <a href="#" class="delete-tax remove">
                                            <i class="icon ion-android-cancel"></i>
                                        </a>
                                        10.00% Sales Tax:
                                    </span>
                                    <span class="value float-end">৳45.00 </span>
                                </li>
                            </ul>
                            <div class="amount-block border-top-0">
                                <div class="total amount">
                                    <div class="side-heading text-center">Total</div>
                                    <div class="amount total-amount">৳2,000.00</div>
                                </div>
                                <div class="total amount-due">
                                    <div class="side-heading text-center">Amount Due </div>
                                    <div class="amount">৳2,000.00 </div>
                                </div>
                            </div>
                            <div class="add-payment">
                                <div class="side-heading fs-12">Add Payment</div>
                                <div class="row g-2">
                                    <div class="col-auto">
                                        <label class="radio-input">
                                            Cash
                                            <input type="radio" name="payment_type" value="Cash" checked>
                                        </label>
                                    </div>
                                    <div class="col-auto">
                                        <label class="radio-input">
                                            Check
                                            <input type="radio" name="payment_type" value="Check">
                                        </label>
                                    </div>
                                    <div class="col-auto">
                                        <label class="radio-input">
                                            Gift Card
                                            <input type="radio" name="payment_type" value="Gift Card">
                                        </label>
                                    </div>
                                    <div class="col-auto">
                                        <label class="radio-input">
                                            Debit Card
                                            <input type="radio" name="payment_type" value="Debit Card">
                                        </label>
                                    </div>
                                    <div class="col-auto">
                                        <label class="radio-input">
                                            Credit Card
                                            <input type="radio" name="payment_type" value="Credit Card">
                                        </label>
                                    </div>
                                </div>
                                <div class="input-group add-payment-form mt-2">
                                    <input type="number" name="amount_tendered" value="0.00" id="amount_tendered"
                                        step="any" class="add-input numKeyboard form-control"
                                        placeholder="Enter Cash Amount">
                                    <button class="btn btn-sm btn-secondary" type="button">Add Payment</button>
                                </div>
                            </div>
                            <div class="comment-block">
                                <label id="comment_label" for="comment" class="side-heading fs-12">Comments :</label>
                                <textarea name="comment" cols="40" rows="2" id="comment" class="form-control" spellcheck="false"></textarea>
                            </div>
                            <div id="finish_sale" class="finish-sale">
                                <button type="submit" class="btn btn-light-success w-100">Finish</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var gridCollapse = document.getElementById('gridCollapse')
            gridCollapse.addEventListener('hide.bs.collapse', function() {
                $('#collapseBtn').text('Show Grid');
            });
            gridCollapse.addEventListener('show.bs.collapse', function() {
                $('#collapseBtn').text('Hide Grid');
            });

            $(document).on('click', '.grid-button', function() {
                var type = $(this).data('type');
                $('#grid-loader').show();
                $(this).addClass('active').siblings().removeClass('active');

                $.ajax({
                    type: "POST",
                    url: "{{ request()->fullUrl() }}",
                    data: {
                        _method: 'GET',
                        type: type
                    },
                    success: function(response) {
                        $('#gridContainer').html(response.data);
                        $('#grid-loader').hide();
                    }
                });
            });

            $(document).on('click', '.select-cat', function() {
                var category_id = $(this).data('id');
                $('#grid-loader').show();

                $.ajax({
                    type: "POST",
                    url: "{{ Route('admin.get-catwise-info') }}",
                    data: {
                        _method: 'GET',
                        category_id: category_id
                    },
                    success: function(response) {
                        $('#gridContainer').html(response.data);
                        $('#grid-loader').hide();
                    }
                });
            });

            $(document).on('click', '.get-back', function() {
                var parent_id = $(this).data('id');
                $('#grid-loader').show();

                $.ajax({
                    type: "POST",
                    url: "{{ Route('admin.get-catwise-info') }}",
                    data: {
                        _method: 'GET',
                        parent_id: parent_id
                    },
                    success: function(response) {
                        $('#grid-loader').hide();
                        $('#gridContainer').html(response.data);
                    }
                });
            });

            $(document).on('click', '.select-tag', function() {
                var tag = $(this).data('tag');
                $('#grid-loader').show();

                $.ajax({
                    type: "POST",
                    url: "{{ Route('admin.get-tagwise-info') }}",
                    data: {
                        _method: 'GET',
                        tag: tag
                    },
                    success: function(response) {
                        $('#grid-loader').hide();
                        $('#gridContainer').html(response.data);
                    }
                });
            });

            $(document).on('click', '.select-vendor', function() {
                var vendor_id = $(this).data('id');
                $('#grid-loader').show();

                $.ajax({
                    type: "POST",
                    url: "{{ Route('admin.get-vendorwise-info') }}",
                    data: {
                        _method: 'GET',
                        vendor_id: vendor_id
                    },
                    success: function(response) {
                        $('#grid-loader').hide();
                        $('#gridContainer').html(response.data);
                    }
                });
            });



            // let rowIdx = 0;

            // // Add row
            // $("#addRow").click(function() {
            //     let row = `
        //             <tr>
        //                 <td>
        //                     <select name="items[${rowIdx}][product_id]" class="form-control product-select" required>
        //                         <option value="">-- Select Product --</option>
        //                         @foreach ($products as $product)
        //                             <option value="{{ $product->id }}">{{ $product->name }}</option>
        //                         @endforeach
        //                     </select>
        //                 </td>
        //                 <td>
        //                     <select name="items[${rowIdx}][product_variant_id]" class="form-control variant-select">
        //                         <option value="">-- Select Variant --</option>
        //                     </select>
        //                 </td>
        //                 <td><input type="number" name="items[${rowIdx}][quantity]" class="form-control qty" value="1" min="1"></td>
        //                 <td><input type="number" step="0.01" name="items[${rowIdx}][unit_price]" class="form-control price" value="0"></td>
        //                 <td><input type="text" class="form-control line-total" readonly></td>
        //                 <td><button type="button" class="btn btn-sm btn-danger removeRow">X</button></td>
        //             </tr>
        //             `;
            //     $("#po-items-table tbody").append(row);
            //     rowIdx++;
            // });

            // // Remove row
            // $(document).on("click", ".removeRow", function() {
            //     $(this).closest("tr").remove();
            //     calculateTotals();
            // });

            // // Fetch variants dynamically
            // $(document).on("change", ".product-select", function() {
            //     let productId = $(this).val();
            //     let variantSelect = $(this).closest("tr").find(".variant-select");

            //     if (productId) {
            //         $.get(`/admin/products/${productId}/variants`, function(res) {
            //             variantSelect.html(res);
            //         });
            //     } else {
            //         variantSelect.html('<option value="">-- Select Variant --</option>');
            //     }
            // });

            // // Recalculate totals
            // $(document).on("input", ".qty, .price, #discount_amount, #tax_amount", function() {
            //     calculateTotals();
            // });

            // function calculateTotals() {
            //     let total = 0;

            //     $("#po-items-table tbody tr").each(function() {
            //         let qty = parseFloat($(this).find(".qty").val()) || 0;
            //         let price = parseFloat($(this).find(".price").val()) || 0;
            //         let lineTotal = qty * price;

            //         $(this).find(".line-total").val(lineTotal.toFixed(2));
            //         total += lineTotal;
            //     });

            //     $("#total_amount").val(total.toFixed(2));

            //     let discount = parseFloat($("#discount_amount").val()) || 0;
            //     let tax = parseFloat($("#tax_amount").val()) || 0;
            //     let grandTotal = total - discount + tax;

            //     $("#grand_total").val(grandTotal.toFixed(2));
            // }
        });
    </script>
@endpush
