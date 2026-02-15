@extends('layouts.admin.create_app')

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
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
                  <input type="text"
                        name="name"
                        value="{{ old('name') }}"
                        class="form-control @error('name') is-invalid @enderror"
                        placeholder="Product Name">

                    @error('name')
                    <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
                <div class="col-sm-6">
                    <label for="category_id" class="form-label"><b>Category <span class="text-danger">*</span></b></label>
                   
                    <select id="category_id" class="form-control" required>
                                    <option value="">-- Select Category --</option>
                                    @foreach($categories_prod as $category)
                                        <option value="{{ $category->id }}">
                                            {{ $category->name }}
                                        </option>
                                    @endforeach
                                </select>
                    
                </div>
                <div class="col-sm-6">
                                    <label class="form-label"><b>Select Sub Category</b></label>

                                    <select id="sub_category_id" name="category_id" class="form-control">
                                        <option value="">-- Select Sub Category --</option>
                                    </select>
                                </div>
                <!-- <div class="col-sm-6">
                    <label for="author_id" class="form-label"><b>Author <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="author_id" id="author_id"
                        data-placeholder="Select Author" required>
                        <option value=""></option>
                        @foreach ($authors as $item)
                            <option value="{{ $item->id }}" {{ old('author_id') == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div> -->
                 <!-- <div class="col-sm-6">
                    <label for="publication_id" class="form-label"><b>Publication <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="publication_id" id="publication_id"
                        data-placeholder="Select Publication" required>
                        <option value=""></option>
                        @foreach ($publications as $item)
                            <option value="{{ $item->id }}" {{ old('publication_id') == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div> -->
                <div class="col-sm-6">
                    <label for="brand_id" class="form-label"><b>Brand</b><span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="brand_id" id="brand_id" data-placeholder="Select Brand" required>
                        <option value=""></option>
                        @foreach ($brands as $item)
                            <option value="{{ $item->id }}" {{ old('brand_id') == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="uom_id" class="form-label"><b>Unit <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="uom_id" id="uom_id" data-placeholder="Select Unit"
                        required>
                        <option value=""></option>
                        @foreach ($uoms as $item)
                            <option value="{{ $item->id }}" {{ old('uom_id') == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="product_type" class="form-label"><b>Product Type <span class="text-danger">*</span></b></label>
                    <select class="form-select select" name="product_type" id="product_type" data-placeholder="Product Type"
                        required>
                        <option value="socks">Socks</option>
                        <option value="clothes">Clothes</option>
                        <option value="sanitary">Sanitary</option>
                        <option value="electric">Electric</option>
                        <option value="electronic">Electronic</option>
                        <option value="frozen">Frozen</option>
                        <option value="beverages">Beverages</option>
                        <option value="bakery">Bakery</option>
                        <option value="grocery">Grocery</option>
                        <option value="others">Others</option>
                    </select>
                </div>
               
             
                <!-- Variant section-->
                <div class="col-12">
                    <label class="form-label"><b>Product Variants</b></label>

                    <div id="variant-wrapper">

                        <div class="variant-item border rounded p-3 mb-3">
                            <div class="row g-2">

                                <div class="col-md-1">
                                    <input type="text" 
                                        name="v_variants[]" 
                                        class="form-control"
                                        placeholder="Color (Red)">
                                </div>

                                <div class="col-md-1">
                                    <input type="text" 
                                        name="v_size[]" 
                                        class="form-control"
                                        placeholder="Size (XL)">
                                </div>

                                <div class="col-md-2">
                                    <input type="number" step="0.01"
                                        name="v_purchase_price[]"
                                        class="form-control"
                                        placeholder="Purchase Price">
                                </div>

                                <div class="col-md-2">
                                    <input type="number" step="0.01"
                                        name="v_regular_price[]"
                                        class="form-control v_regular_price"
                                        placeholder="Regular Price">
                                </div>

                                <div class="col-md-1">
                                    <input type="number" step="0.01"
                                        name="v_discount[]"
                                        class="form-control v_discount"
                                        placeholder="Disc">
                                </div>

                                <div class="col-md-2">
                                    <input type="number" step="0.01"
                                        name="v_sale_price[]"
                                        class="form-control v_sale_price"
                                        placeholder="Sale"
                                        readonly>
                                </div>

                                <div class="col-md-1">
                                    <select name="v_discount_type[]" 
                                        class="form-select v_discount_type">
                                        <option value="percent">%</option>
                                        <option value="fixed">৳</option>
                                    </select>
                                </div>

                                <div class="col-md-1 d-flex">
                                    <button type="button" 
                                        class="btn btn-danger remove-variant w-100">
                                        ✕
                                    </button>
                                </div>

                            </div>
                        </div>

                    </div>

                    <button type="button" id="add-variant" class="btn btn-primary btn-sm">
                        + Add More
                    </button>
                </div>



                <div class="col-sm-6">
                    <label for="vendor_id" class="form-label"><b>Suppliers</b></label>
                    <select name="vendor_id[]" id="vendor_id" class="form-select select" data-placeholder="Select Vendors"
                        multiple>
                        <option value=""></option>
                        @foreach ($vendors as $item)
                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                    </select>
                </div>
                 <div class="col-6">
                    <label for="status" class="form-label"><b>Status</b></label>
                    <select name="status" id="status" class="form-select select">
                    <option value="">Select Status</option>
                    <option value="0">
                        Inactive
                    </option>
                    <option value="1">
                        Active
                    </option>
                </select>
                </div>
                <div class="col-12">
                    <label for="tags" class="form-label"><b>Tags</b></label>
                    <input type="text" class="form-control" id="tags" name="tags[]" value="{{ old('tags.0') }}"
                        placeholder="Tags">
                </div>
                <div class="col-12">
                    <div class="row g-2">
                        <label for="favorite" class="col-sm-3 col-md-3 col-lg-2 control-label"><b>Is Favorite:</b></label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="favorite" name="favorite"
                                    {{ old('favorite') ? 'checked' : '' }}>
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
                                    name="custom_barcode" {{ old('custom_barcode') ? 'checked' : '' }}>
                                <label for="custom_barcode" class="custom-control-label"></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12" id="barcodeWrapper"
                    style="display: {{ old('custom_barcode') ? 'block' : 'none' }};">
                    <div class="row g-2">
                        <label for="barcode" class="col-sm-3 col-md-3 col-lg-2 control-label"><b>Custom
                                Barcode:</b></label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <input type="text" class="form-control" id="barcode" name="barcode"
                                placeholder="Barcode" value="{{ old('barcode') }}"
                                {{ old('custom_barcode') ? 'required' : '' }}>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <label for="short_description" class="form-label"><b>Short Description</b></label>
                    <textarea class="form-control short_description" id="short_description" name="short_description" cols="30"
                        rows="10" placeholder="Short Description">{!! old('short_description') !!}</textarea>
                </div>
                <div class="col-12">
                    <label for="description" class="form-label"><b>Description</b></label>
                    <textarea class="form-control description" id="description" name="description" cols="30" rows="10"
                        placeholder="Description">{!! old('description') !!}</textarea>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-media" role="tabpanel" aria-labelledby="nav-media-tab" tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Product Files &amp; Media</h5>
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="thumbnail" class="form-label"><b>Image</b></label>
                    <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*">
                </div>
                <div class="col-sm-6">
                    <label for="images" class="form-label"><b>Other Images</b></label>
                    <input type="file" class="form-control" id="images" name="images[]" multiple
                        accept="image/*">
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
                            <input type="number" min="0" value="0" step="0.01"
                                placeholder="Purchase price" name="purchase_price" id="purchase_price"
                                class="form-control" value="{{ old('purchase_price') }}" required>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-md-3 col-from-label" for="regular_price"><b>Regular price <span
                                    class="text-danger">*</span></b></label>
                        <div class="col-md-6">
                            <input type="number" min="0" value="0" step="0.01"
                                placeholder="Regular price" name="regular_price" id="regular_price" class="form-control"
                                value="{{ old('regular_price') }}" required>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="row g-3">
                        <label class="col-sm-3 control-label" for="date_range"><b>Discount Date Range</b></label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control date-range" name="date_range" id="date_range"
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
                            <input type="number" min="0" value="0" step="0.01" placeholder="Discount"
                                name="discount" id="discount" class="form-control" value="{{ old('discount') }}"
                                required>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control select" name="discount_type"
                                data-placeholder="Select Discount Type" required>
                                <option value="amount" {{ old('discount_type') == 'amount' ? 'selected' : '' }}>Flat
                                </option>
                                <option value="percent" {{ old('discount_type') == 'percent' ? 'selected' : '' }}>Percent
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
                                value="{{ old('sku') }}">
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
                                @foreach ($attributes as $attribute)
                                    <option value="{{ $attribute->id }}">{{ $attribute->name }}</option>
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
                        value="{{ old('meta_title') }}" placeholder="Meta Title">
                </div>
                <div class="col-sm-6">
                    <label for="meta_image" class="form-label"><b>Meta Image</b></label>
                    <input type="file" class="form-control" id="meta_image" name="meta_image" accept="image/*">
                </div>
                <div class="col-12">
                    <label for="meta_description" class="form-label"><b>Meta Description</b></label>
                    <textarea class="form-control" name="meta_description" id="meta_description" cols="30" rows="5"
                        placeholder="Meta Description">{{ old('meta_description') }}</textarea>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
<script>
document.addEventListener('DOMContentLoaded', function () {

    const wrapper = document.getElementById('variant-wrapper');
    const addBtn = document.getElementById('add-variant');

    // 🔥 Calculate Sale Price
    function calculateSalePrice(row) {

        let regular = parseFloat(row.querySelector('.v_regular_price')?.value) || 0;
        let discount = parseFloat(row.querySelector('.v_discount')?.value) || 0;
        let type = row.querySelector('.v_discount_type')?.value;

        let sale = regular;

        if (type === 'percent') {
            sale = regular - (regular * discount / 100);
        } else {
            sale = regular - discount;
        }

        if (sale < 0) sale = 0;

        row.querySelector('.v_sale_price').value = sale.toFixed(2);
    }

    // 🔥 Hide First Remove Button
    function updateRemoveButtons() {
        let rows = document.querySelectorAll('.variant-item');

        rows.forEach((row, index) => {
            let btn = row.querySelector('.remove-variant');
            btn.style.display = index === 0 ? 'none' : 'block';
        });
    }

    // 🔥 Input Listener
    document.addEventListener('input', function (e) {

        if (
            e.target.classList.contains('v_regular_price') ||
            e.target.classList.contains('v_discount')
        ) {
            let row = e.target.closest('.variant-item');
            calculateSalePrice(row);
        }

    });

    document.addEventListener('change', function (e) {

        if (e.target.classList.contains('v_discount_type')) {
            let row = e.target.closest('.variant-item');
            calculateSalePrice(row);
        }

    });

    // 🔥 Add More
    addBtn.addEventListener('click', function () {

        let html = `
        <div class="variant-item border rounded p-3 mb-3">
            <div class="row g-2">

                <div class="col-md-1">
                    <input type="text" name="v_variants[]" class="form-control"
                        placeholder="Color (Red)">
                </div>

                <div class="col-md-1">
                    <input type="text" name="v_size[]" class="form-control"
                        placeholder="Size (XL)">
                </div>

                <div class="col-md-2">
                    <input type="number" step="0.01" name="v_purchase_price[]" class="form-control"
                        placeholder="Purchase">
                </div>

                <div class="col-md-2">
                    <input type="number" step="0.01" name="v_regular_price[]" 
                        class="form-control v_regular_price"
                        placeholder="Regular">
                </div>

                <div class="col-md-1">
                    <input type="number" step="0.01" name="v_discount[]" 
                        class="form-control v_discount"
                        placeholder="Disc">
                </div>

                <div class="col-md-2">
                    <input type="number" step="0.01" name="v_sale_price[]" 
                        class="form-control v_sale_price"
                        placeholder="Sale" readonly>
                </div>

                <div class="col-md-1">
                    <select name="v_discount_type[]" 
                        class="form-select v_discount_type">
                        <option value="percent">%</option>
                        <option value="fixed">৳</option>
                    </select>
                </div>

                <div class="col-md-1 d-flex">
                    <button type="button" class="btn btn-danger remove-variant w-100">✕</button>
                </div>

            </div>
        </div>
        `;

        wrapper.insertAdjacentHTML('beforeend', html);
        updateRemoveButtons();
    });

    // 🔥 Remove
    document.addEventListener('click', function (e) {

        if (e.target.classList.contains('remove-variant')) {
            e.target.closest('.variant-item').remove();
            updateRemoveButtons();
        }

    });

    updateRemoveButtons();

});
</script>



<script>
 const subCategories = @json($sub_categories);
    document.getElementById('category_id').addEventListener('change', function () {
        const categoryId = this.value;
        const subCategorySelect = document.getElementById('sub_category_id');

        // reset
        subCategorySelect.innerHTML = '<option value="">-- Select Sub Category --</option>';

        if (categoryId && subCategories[categoryId]) {
            subCategories[categoryId].forEach(function (sub) {
                const option = document.createElement('option');
                option.value = sub.id;
                option.textContent = sub.name;
                subCategorySelect.appendChild(option);
            });
        }
    });
</script>
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
                    $('#barcode').val(''); // optional: clear input when hiding
                    $('#barcode').prop('required', false);
                }
            });

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
                    url: "{{ Route('admin.product.sku-combination') }}",
                    data: $('#store_form').serialize(),
                    success: function(data) {
                        $('#sku_combination').html(data);
                        if (data.length > 1) {
                            $('#show-hide-div').hide();
                        } else {
                            $('#show-hide-div').show();
                        }
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
