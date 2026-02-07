@extends('layouts.admin.create_app')

@push('plugin')
    <link href="{{ asset('backend/css/TreeMenu.css') }}" rel="stylesheet" />
@endpush

@section('content')
    <nav class="nav__wrapper">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-general-tab" data-bs-toggle="tab" data-bs-target="#nav-general"
                type="button" role="tab" aria-controls="nav-general" aria-selected="true">General</button>
            <button class="nav-link" id="nav-media-tab" data-bs-toggle="tab" data-bs-target="#nav-media" type="button"
                role="tab" aria-controls="nav-media" aria-selected="false">Files & Media</button>
            <button class="nav-link" id="nav-price-tab" data-bs-toggle="tab" data-bs-target="#nav-price" type="button"
                role="tab" aria-controls="nav-price" aria-selected="false">Price</button>
            <button class="nav-link" id="nav-seo-tab" data-bs-toggle="tab" data-bs-target="#nav-seo" type="button"
                role="tab" aria-controls="nav-seo" aria-selected="false">SEO</button>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-general-tab"
            tabindex="0">
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Book Information</h5>
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="name" class="form-label"><b>Book Name <span
                                        class="text-danger">*</span></b></label>
                            <input type="text" class="form-control" id="name" name="name"
                                value="{{ old('name') }}" placeholder="Name" required>
                        </div>
                        <div class="col-sm-6">
                            <label for="file" class="form-label"><b>PDF</b></label>
                            <input type="file" name="file" id="file" class="form-control"
                                accept="image/*, application/pdf">
                        </div>
                        <div class="col-sm-6">
                            <label for="uom_id" class="form-label"><b>UOM <span class="text-danger">*</span></b></label>
                            <select class="form-select select" name="uom_id" id="uom_id" data-placeholder="Select UOM"
                                required>
                                @foreach ($uoms->where('name', 'Pcs') as $item)
                                    <option value="{{ $item->id }}" {{ old('uom_id') == $item->id ? 'selected' : '' }}>
                                        {{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="publication_id" class="form-label"><b>Publication <span
                                        class="text-danger">*</span></b></label>
                            <select class="form-select select" name="publication_id" id="publication_id"
                                data-placeholder="Select Publication" required>
                                <option value=""></option>
                                @foreach ($publications as $item)
                                    <option value="{{ $item->id }}"
                                        {{ old('publication_id') == $item->id ? 'selected' : '' }}>
                                        {{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="author_ids" class="form-label"><b>Authors <span
                                        class="text-danger">*</span></b></label>
                            <select class="form-select select" name="author_ids[]" id="author_ids"
                                data-placeholder="Select Authors" multiple required>
                                <option value=""></option>
                                @foreach ($authors as $item)
                                    <option value="{{ $item->id }}"
                                        {{ in_array($item->id, old('author_id', [])) ? 'selected' : '' }}>
                                        {{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="vendor_id" class="form-label"><b>Suppliers</b></label>
                            <select name="vendor_id[]" id="vendor_id" class="form-select select"
                                data-placeholder="Select Vendors" multiple>
                                <option value=""></option>
                                @foreach ($vendors as $item)
                                    <option value="{{ $item->id }}"
                                        {{ in_array($item->id, old('vendor_id', [])) ? 'selected' : '' }}>
                                        {{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="tags" class="form-label"><b>Tags</b></label>
                            <input type="text" class="form-control" id="tags" name="tags[]"
                                value="{{ old('tags.0') }}" placeholder="Tags">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card custom-card">
                        <div class="card-header flex-row align-items-center justify-content-between">
                            <h5 class="mb-0 h6 py-1 text-uppercase">Product category</h5>
                            <h6 class="d-inline-flex align-items-center fs-13 mb-0">
                                Select Main
                                <span class="tt ms-1" title="This will be used for homepage category wise product Show.">
                                    <i class="fal fa-question-circle fs-18 text-info"></i>
                                </span>
                            </h6>
                        </div>
                        <div class="card-body p-0">
                            <div class="overflow-auto c-scrollbar-light" style="height: 320px;">
                                <div id="treeview_container" class="hummingbird-treeview tree">
                                    <ul id="makeTree" class="hummingbird-base">
                                        {!! $html !!}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row g-3">
                        <div class="col">
                            <div class="row g-2 align-items-center">
                                <div class="col-auto">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="trending"
                                            name="trending" {{ old('trending') ? 'checked' : '' }}>
                                        <label for="trending" class="custom-control-label"></label>
                                    </div>
                                </div>
                                <label for="trending" class="col-auto control-label"><b>Is Trending:</b></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row g-2 align-items-center">
                                <div class="col-auto">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="new_arrival"
                                            name="new_arrival" {{ old('new_arrival') ? 'checked' : '' }}>
                                        <label for="new_arrival" class="custom-control-label"></label>
                                    </div>
                                </div>
                                <label for="new_arrival" class="col-auto control-label"><b>Is New Arrival:</b></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row g-2 align-items-center">
                                <div class="col-auto">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="best_seller"
                                            name="best_seller" {{ old('best_seller') ? 'checked' : '' }}>
                                        <label for="best_seller" class="custom-control-label"></label>
                                    </div>
                                </div>
                                <label for="best_seller" class="col-auto control-label"><b>Is Best Seller:</b></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row g-2 align-items-center">
                                <div class="col-auto">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="favorite"
                                            name="favorite" {{ old('favorite') ? 'checked' : '' }}>
                                        <label for="favorite" class="custom-control-label"></label>
                                    </div>
                                </div>
                                <label for="favorite" class="col-auto control-label"><b>Is Favorite:</b></label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row g-2 align-items-center">
                                <div class="col-auto">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="custom_barcode"
                                            name="custom_barcode" {{ old('custom_barcode') ? 'checked' : '' }}>
                                        <label for="custom_barcode" class="custom-control-label"></label>
                                    </div>
                                </div>
                                <label for="custom_barcode" class="col-auto control-label"><b>Is Custom
                                        Barcode:</b></label>
                            </div>
                        </div>
                        <div class="col-12" id="barcodeWrapper"
                            style="display: {{ old('custom_barcode') ? 'block' : 'none' }};">
                            <label for="barcode" class="form-label"><b>Custom Barcode: <span
                                        class="text-danger">*</span></b></label>
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
            <h5 class="mb-3 pb-3 fs-17 fw-700" style="border-bottom: 1px dashed #e4e5eb;">Product price</h5>
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
    <script type="text/javascript" src="{{ asset('backend/js/TreeMenu.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            make_tree_menu('makeTree');

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
        });
    </script>
@endpush
