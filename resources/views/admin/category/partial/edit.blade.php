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
                                      <option value="header_top" {{ $data->position == 'header_top' ? 'selected' : '' }}>
                                        Header Top
                                    </option>

                                    <option value="header" {{ $data->position == 'header' ? 'selected' : '' }}>
                                        Header Middle
                                    </option>

                                    <option value="mega_menu_parent" {{ $data->position == 'mega_menu_parent' ? 'selected' : '' }}>
                                        Mega Menu Parent
                                    </option>
                                    <option value="mega_menu_child" {{ $data->position == 'mega_menu_child' ? 'selected' : '' }}>
                                        Mega Menu Child
                                    </option>
                                    <option value="homepage" {{ $data->position == 'homepage' ? 'selected' : '' }}>
                                        Home Page
                                    </option>
                                    <option value="homepage_banner_category" {{ $data->position == 'homepage_banner_category' ? 'selected' : '' }}>
                                        Home Page->Banner Category
                                    </option>
                                    <option value="homepage_writter_category" {{ $data->position == 'homepage_writter_category' ? 'selected' : '' }}>
                                        Home Page->Writter Category
                                    </option>
                                    <option value="homepage_others_category" {{ $data->position == 'homepage_others_category' ? 'selected' : '' }}>
                                        Home Page->Others Category
                                    </option>
                                    <option value="homepage_brands_category" {{ $data->position == 'homepage_brands_category' ? 'selected' : '' }}>
                                        Home Page->Brands Category
                                    </option>

                                    <option value="footer" {{ $data->position == 'footer' ? 'selected' : '' }}>
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
