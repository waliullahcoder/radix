@extends('layouts.admin.edit_app')

@section('content')
    <nav class="nav__wrapper">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-general-tab" data-bs-toggle="tab" data-bs-target="#nav-general"
                type="button" role="tab" aria-controls="nav-general" aria-selected="true">General</button>
            <button class="nav-link" id="nav-media-tab" data-bs-toggle="tab" data-bs-target="#nav-media" type="button"
                role="tab" aria-controls="nav-media" aria-selected="false">Files & Media</button>
            <button class="nav-link" id="nav-price-tab" data-bs-toggle="tab" data-bs-target="#nav-price" type="button"
                role="tab" aria-controls="nav-price" aria-selected="false">Price & Variation</button>
            <button class="nav-link" id="nav-seo-tab" data-bs-toggle="tab" data-bs-target="#nav-seo" type="button"
                role="tab" aria-controls="nav-seo" aria-selected="false">SEO</button>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-general-tab"
            tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Product Information</h5>
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="name" class="form-label"><b>Product Name <span class="text-danger">*</span></b></label>
                    <input type="text" class="form-control" id="name" name="name"
                        value="{{ old('name', $data->name) }}" placeholder="Name" required>
                </div>
                <div class="col-sm-6">
                    <label for="category_id" class="form-label"><b>Category <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="category_id" id="category_id"
                        data-placeholder="Select Category" required>
                        <option value=""></option>
                        @foreach ($additionalData['categories'] as $item)
                            <option value="{{ $item->id }}"
                                {{ old('category_id', $data->category_id) == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="brand_id" class="form-label"><b>Brand</b></label>
                    <select class="form-select select" name="brand_id" id="brand_id" data-placeholder="Select Brand">
                        <option value=""></option>
                        @foreach ($additionalData['brands'] as $item)
                            <option value="{{ $item->id }}"
                                {{ old('brand_id', $data->brand_id) == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="uom_id" class="form-label"><b>Unit <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="uom_id" id="uom_id" data-placeholder="Select Unit"
                        required>
                        <option value=""></option>
                        @foreach ($additionalData['uoms'] as $item)
                            <option value="{{ $item->id }}"
                                {{ old('uom_id', $data->uom_id) == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12">
                    <label for="vendor_id" class="form-label"><b>Suppliers</b></label>
                    <select name="vendor_id[]" id="vendor_id" class="form-select select" data-placeholder="Select Vendors"
                        multiple>
                        <option value=""></option>
                        @foreach ($additionalData['vendors'] as $item)
                            <option value="{{ $item->id }}"
                                {{ in_array($item->id, old('vendor_id', $data->vendors->pluck('id')->toArray())) ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-12">
                    <label for="tags" class="form-label"><b>Tags</b></label>
                    <input type="text" class="form-control" id="tags" name="tags[]"
                        value="{{ json_encode($data->tags->pluck('name')->toArray()) }}" placeholder="Tags">
                </div>
                <div class="col-12">
                    <div class="row g-2">
                        <label for="favorite" class="col-sm-3 col-md-3 col-lg-2 control-label"><b>Is Favorite:</b></label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="favorite" name="favorite"
                                    {{ $data->favorite ? 'checked' : '' }}>
                                <label for="favorite" class="custom-control-label"></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row g-2">
                        <label for="custom_barcode" class="col-sm-3 col-md-3 col-lg-2 control-label"><b>Is Custom
                                Barcode:</b></label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="custom_barcode"
                                    name="custom_barcode" {{ $data->custom_barcode ? 'checked' : '' }}>
                                <label for="custom_barcode" class="custom-control-label"></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12" id="barcodeWrapper"
                    style="display: {{ $data->custom_barcode ? 'block' : 'none' }};">
                    <div class="row g-2">
                        <label for="barcode" class="col-sm-3 col-md-3 col-lg-2 control-label"><b>Custom
                                Barcode:</b></label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <input type="text" class="form-control" id="barcode" name="barcode"
                                value="{{ old('barcode', $data->barcode) }}" placeholder="Barcode"
                                {{ $data->custom_barcode ? 'required' : '' }}>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <label for="short_description" class="form-label"><b>Short Description</b></label>
                    <textarea class="form-control short_description" id="short_description" name="short_description" cols="30"
                        rows="10" placeholder="Short Description">{!! old('short_description', $data->short_description) !!}</textarea>
                </div>
                <div class="col-12">
                    <label for="description" class="form-label"><b>Description</b></label>
                    <textarea class="form-control description" id="description" name="description" cols="30" rows="10"
                        placeholder="Description">{!! old('description', $data->description) !!}</textarea>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-media" role="tabpanel" aria-labelledby="nav-media-tab" tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Product Files &amp; Media</h5>
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="thumbnail" class="form-label"><b>Image</b></label>
                    <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*">
                    @if (file_exists($data->thumbnail))
                        <img class="flex-shrink-0" src="{{ asset($data->thumbnail) }}" height="36" alt="Image">
                    @endif
                </div>
                <div class="col-sm-6">
                    <label for="images" class="form-label"><b>Other Images</b></label>
                    <input type="file" class="form-control" id="images" name="images[]" multiple
                        accept="image/*">
                    @foreach ($data->images as $item)
                        @if (file_exists($item->image))
                            <img class="flex-shrink-0" src="{{ asset($item->image) }}" height="36" alt="Image">
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-price" role="tabpanel" aria-labelledby="nav-price-tab" tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Product price & Variation</h5>
            <div class="row g-3">
                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-md-3 col-from-label" for="purchase_price"><b>Purchase price <span
                                    class="text-danger">*</span></b></label>
                        <div class="col-md-6">
                            <input type="number" min="0" step="0.01" placeholder="Purchase price"
                                name="purchase_price" id="purchase_price" class="form-control"
                                value="{{ old('purchase_price', $data->purchase_price) }}" required>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-md-3 col-from-label" for="regular_price"><b>Regular price <span
                                    class="text-danger">*</span></b></label>
                        <div class="col-md-6">
                            <input type="number" min="0" step="0.01" placeholder="Regular price"
                                name="regular_price" id="regular_price" class="form-control"
                                value="{{ old('regular_price', $data->regular_price) }}" required>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-sm-3 control-label" for="date_range"><b>Discount Date Range</b></label>
                        <div class="col-sm-6">
                            @php
                                $start_date = date('d-m-Y H:i:s', strtotime($data->discount_start_date));
                                $end_date = date('d-m-Y H:i:s', strtotime($data->discount_end_date));
                            @endphp
                            <input type="text" class="form-control date-range" name="date_range" id="date_range"
                                @if ($data->discount_start_date && $data->discount_end_date) value="{{ $start_date . ' to ' . $end_date }}" @endif
                                placeholder="Select Date" data-time-picker="true" data-format="DD-MM-Y HH:mm:ss"
                                data-separator=" to " autocomplete="off">
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-md-3 col-from-label" for="discount"><b>Discount <span
                                    class="text-danger">*</span></b></label>
                        <div class="col-md-3">
                            <input type="number" min="0" step="0.01" placeholder="Discount" name="discount"
                                id="discount" class="form-control" value="{{ old('discount', $data->discount) }}"
                                required>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control select" name="discount_type"
                                data-placeholder="Select Discount Type" required>
                                <option value="amount"
                                    {{ old('discount_type', $data->discount_type) == 'amount' ? 'selected' : '' }}>Flat
                                </option>
                                <option value="percent"
                                    {{ old('discount_type', $data->discount_type) == 'percent' ? 'selected' : '' }}>Percent
                                </option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-md-3 col-from-label" for="sku"><b>SKU</b></label>
                        <div class="col-md-6">
                            <input type="text" name="sku" id="sku" class="form-control" placeholder="SKU"
                                value="{{ old('sku', $data->sku) }}">
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <input type="text" class="form-control" value="Attributes" disabled>
                        </div>
                        <div class="col-md-8">
                            <select name="choice_attributes[]" id="choice_attributes" class="form-control select"
                                data-selected-text-format="count" data-live-search="true" multiple
                                data-placeholder="Choose Attributes">
                                @foreach ($additionalData['attributes'] as $attribute)
                                    <option value="{{ $attribute->id }}"
                                        {{ in_array($attribute->id, $data->unique_attributes->pluck('id')->toArray()) ? 'selected' : '' }}>
                                        {{ $attribute->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <p>Choose the attributes of this product and then input values of each attribute</p>
                </div>

                <div class="col-12">
                    <div class="customer_choice_options row g-3" id="customer_choice_options">
                        @foreach ($data->unique_attributes as $attribute)
                            <div class="col-12">
                                <div class="row g-3">
                                    <div class="col-md-3">
                                        <input type="hidden" name="choice_no[]" value="{{ $attribute->id }}">
                                        <input type="text" class="form-control" name="choice[]"
                                            value="{{ $attribute->name }}" placeholder="Choice Title" readonly>
                                    </div>
                                    <div class="col-md-8">
                                        <select class="form-control select attribute_choice"
                                            name="choice_options_{{ $attribute->id }}[]" multiple
                                            data-placeholder="Select {{ $attribute->name }}">

                                            @foreach (\App\Models\AttributeValue::where('attribute_id', $attribute->id)->get() as $row)
                                                <option value="{{ $row->id }}"
                                                    {{ in_array($row->id, $attribute->values->pluck('id')->toArray()) ? 'selected' : '' }}>
                                                    {{ $row->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>

                <div class="sku_combination" id="sku_combination">
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-seo" role="tabpanel" aria-labelledby="nav-seo-tab" tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">SEO Meta Tags</h5>
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="meta_title" class="form-label"><b>Meta Title</b></label>
                    <input type="text" class="form-control" id="meta_title" name="meta_title"
                        value="{{ old('meta_title', $data->meta_title) }}" placeholder="Meta Title">
                </div>
                <div class="col-sm-6">
                    <label for="meta_image" class="form-label"><b>Meta Image</b></label>
                    <input type="file" class="form-control" id="meta_image" name="meta_image" accept="image/*">
                </div>
                <div class="col-12">
                    <label for="meta_description" class="form-label"><b>Meta Description</b></label>
                    <textarea class="form-control" name="meta_description" id="meta_description" cols="30" rows="5"
                        placeholder="Meta Description">{{ old('meta_description', $data->meta_description) }}</textarea>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var input = document.querySelector('#tags');
            new Tagify(input);

            $(document).on('change', '#custom_barcode', function() {
                if ($(this).is(':checked')) {
                    $('#barcodeWrapper').show(); // show barcode input
                    $('#barcode').prop('required', true);
                } else {
                    $('#barcodeWrapper').hide(); // hide barcode input
                    $('#barcode').prop('required', false);
                }
            });

            updateSku();

            function add_more_customer_choice_option(i, name) {
                $.ajax({
                    url: "{{ url()->full() }}",
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        attribute_id: i,
                        get_choices: true
                    },
                    success: function(data) {
                        var obj = JSON.parse(data);
                        $('#customer_choice_options').append(`
                            <div class="col-12">
                                <div class="row g-3">
                                    <div class="col-md-3">
                                        <input type="hidden" name="choice_no[]" value="${i}">
                                        <input type="text" class="form-control" name="choice[]" value="${name}" placeholder="Choice Title" readonly>
                                    </div>
                                    <div class="col-md-8">
                                        <select class="form-control select attribute_choice" name="choice_options_${i}[]" multiple data-placeholder="Select ${name}">${obj}</select>
                                    </div>
                                </div>
                            </div>`);

                        $('.select').select2({
                            allowClear: true,
                        });
                    }
                });
            }

            $(document).on("change", ".attribute_choice", function() {
                updateSku();
            });

            $('input[name="purchase_price"], input[name="regular_price"]').on('keyup', function() {
                updateSku();
            });

            function updateSku() {
                $.ajax({
                    type: "POST",
                    url: "{{ route('admin.product.sku-combination.edit', $data->id) }}",
                    data: $('#update_form').serialize() + '&_method=POST',
                    success: function(response) {
                        $('#sku_combination').html(response);
                        $('#show-hide-div').toggle(response.length <= 1);
                    }
                });
            }

            $('#choice_attributes').on('change', function() {
                $('#customer_choice_options').html(null);
                $.each($("#choice_attributes option:selected"), function() {
                    add_more_customer_choice_option($(this).val(), $(this).text());
                });
                updateSku();
            });
        });
    </script>
@endpush
