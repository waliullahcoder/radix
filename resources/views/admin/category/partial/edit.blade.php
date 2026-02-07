<form action="{{ route('admin.category.update', $data->id) }}"
      method="POST"
      enctype="multipart/form-data">
    @csrf
    @method('PUT')

    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Update Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <input type="hidden" name="parent_id" value="{{ $data->parent_id }}">
                <div class="modal-body">
                    <div class="mb-2">
                        <label class="form-label">Name</label>
                        <input type="text"
                               name="name"
                               class="form-control"
                               value="{{ $data->name }}"
                               required>
                    </div>

                    <div class="mb-2">
                                    <label for="position" class="form-label"><b>Position</b></label>
                                    <select name="position" id="position" class="form-select" required>
                                     <option value="header_parent" {{ $data->position == 'header_parent' ? 'selected' : '' }}>
                                        Header Parent
                                    </option>
                                    <option value="header_child" {{ $data->position == 'header_child' ? 'selected' : '' }}>
                                        Header Child
                                    </option>

                                     <option value="left_side" {{ $data->position == 'left_side' ? 'selected' : '' }}>
                                        Left Side
                                    </option>
                                    <option value="feature_product" {{ $data->position == 'feature_product' ? 'selected' : '' }}>
                                        Featured Product
                                    </option>
                                    <option value="banner_section" {{ $data->position == 'banner_section' ? 'selected' : '' }}>
                                        Banner Section
                                    </option>
                                    <option value="exclusive_collection" {{ $data->position == 'exclusive_collection' ? 'selected' : '' }}>
                                        Exclusive Collection
                                    </option>
                                    <option value="footer_col1" {{ $data->position == 'footer_col1' ? 'selected' : '' }}>
                                        Footer Column1
                                    </option>

                                    <option value="footer_col2" {{ $data->position == 'footer_col2' ? 'selected' : '' }}>
                                        Footer Column2
                                    </option>

                                    </select>
                                </div>
                        <div class="mb-2">
                            <label for="url" class="form-label">URL: <span class="text-danger">*</span></label>
                            <input type="text" name="url" id="url" class="form-control" value="{{  $data->getRawOriginal('url') }}" required>
                        </div>
                    <div class="mb-2">
                        <label class="form-label">Description</label>
                        <textarea name="description"
                                  class="form-control"
                                  rows="3">{{ $data->description }}</textarea>
                    </div>
                     <div class="mb-2">
                        <label for="image" class="form-label">Image</label>
                        <input type="file"
                            name="image"
                            id="image"
                            class="form-control"
                            accept="image/*">
                    </div>

                    {{-- CURRENT IMAGE --}}
                    @if(!empty($data->image))
                        <div class="mt-2">
                            <label class="form-label d-block">Current Image</label>
                            <img src="{{ asset($data->image) }}"
                                alt="Current Image"
                                style="width:120px;height:auto;border:1px solid #ddd;padding:4px;border-radius:4px;">
                        </div>
                    @endif
                </div>

                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">Close</button>
                    <button type="submit"
                            class="btn btn-primary">Update</button>
                </div>

            </div>
        </div>
    </div>
</form>
