@php
    $route = \Request::route()->getName();
    $storeRoute = str_replace('index', 'store', $route);
@endphp

<form action="{{ Route($storeRoute) }}" method="POST" enctype="multipart/form-data">
    @csrf
    <!-- Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addModalLabel">Add New Category</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="parent_id" class="form-label">Parent Category:</label>
                            <select name="parent_id" id="parent_id" class="form-select select"
                                data-placeholder="Select Parent Category">
                                <option value="">None</option>
                                @php
                    
                                        $categories = \App\Models\Category::with(['children'])
                                        ->whereNull('parent_id')
                                        ->whereIn('position', ['header_parent', 'left_side', 'feature_product', 'banner_section', 'exclusive_collection', 'footer_col1', 'footer_col2'])
                                        ->where('status', 1)
                                        ->orderBy('name', 'asc')
                                        ->get();
                                @endphp
                                @foreach ($categories as $item)
                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-12">
                                    <label for="position" class="form-label"><b>Position</b></label>
                                     <select name="position" id="position" class="form-select" required>
                                    <option value="header_parent" {{ old('position') == 'header_parent' ? 'selected' : '' }}>
                                        Header Parent
                                    </option>
                                    <option value="header_child" {{ old('position') == 'header_child' ? 'selected' : '' }}>
                                        Header Child
                                    </option>
                                    <option value="single_page" {{ old('position') == 'single_page' ? 'selected' : '' }}>
                                        Single Page
                                    </option>

                                     <option value="left_side" {{ old('position') == 'left_side' ? 'selected' : '' }}>
                                        Left Side
                                    </option>
                                    <option value="feature_product" {{ old('position') == 'feature_product' ? 'selected' : '' }}>
                                        Featured Product
                                    </option>
                                    <option value="banner_section" {{ old('position') == 'banner_section' ? 'selected' : '' }}>
                                        Banner Section
                                    </option>
                                    <option value="exclusive_collection" {{ old('position') == 'exclusive_collection' ? 'selected' : '' }}>
                                        Exclusive Collection
                                    </option>
                                    <option value="footer_col1" {{ old('position') == 'footer_col1' ? 'selected' : '' }}>
                                        Footer Column1
                                    </option>

                                    <option value="footer_col2" {{ old('position') == 'footer_col2' ? 'selected' : '' }}>
                                        Footer Column2
                                    </option>

                                    </select>
                                </div>
                            <div class="col-12">
                            <label for="url" class="form-label">URL: <span class="text-danger">*</span></label>
                            <input type="text" name="url" id="url" class="form-control" value="#" required>
                        </div>
                        <div class="col-12">
                            <label for="name" class="form-label">Name: <span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>

                        <div class="col-12">
                            <label for="image" class="form-label">Image:</label>
                            <input type="file" name="image" id="image" class="form-control" accept="image/*">
                        </div>

                        
                        <div class="col-12">
                            <label for="description" class="form-label"><b>Description</b></label>
                            <textarea class="form-control description" id="description" name="description" cols="30" rows="10"
                            placeholder="Description"></textarea>
                            </div>
                        </div>
                </div>
                <div class="modal-footer p-1">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</form>
