@extends('layouts.admin.app')

@push('plugin')
    <link href="{{ asset('backend/css/TreeMenu.css') }}" rel="stylesheet" />
@endpush

@section('content')
    <a href="#" class="btn btn-sm btn-primary" id="addBtnModal" data-id="">Add Root
        Category</a>
    <div class="form-group" style="margin:10px 0;">
        <input type="text" id="category_search" class="form-control" placeholder="Search" wfd-id="id11">
    </div>
    <div class="tree">
        <ul id="makeTree">
            <li class="item">
                <h6 class="mb-0 text-uppercase fw-bold">Categories</h6>
                <ul>
                    @php
                        $categories = \App\Models\Category::root()
                            ->with(['children'])
                            ->orderBy('name', 'asc')
                            ->get();
                    @endphp
                    <ul>
                        @foreach ($categories as $category)
                            @include('admin.category.partial._category', ['category' => $category])
                        @endforeach
                    </ul>
                </ul>
            </li>
        </ul>
    </div>
    @include('admin.category.partial.create')
    <div id="editForm"></div>
@endsection

@push('js')
    <script type="text/javascript" src="{{ asset('backend/js/TreeMenu.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            make_tree_menu('makeTree');

            function filter_categories() {
                var query = $('#category_search').val().toLowerCase();

                if (!query) {
                    $('#makeTree li').show();
                    return;
                }

                $('#makeTree li').hide();

                $('#makeTree li').filter(function() {
                    return $(this).children('span.category_name').text().toLowerCase().indexOf(query) !== -
                        1;
                }).each(function() {
                    $(this).show();
                    $(this).parents('li').show();
                });
            }

            $(document).on('keyup', '#category_search', filter_categories);

            $(document).on('click', '#addBtnModal', function() {
                var parent_id = $(this).data('id');
                $('#parent_id').val(parent_id).trigger('change');
                $('#addModal').modal('show');
            });

            $(document).on('click', '.add_child_category', function() {
                var parent_id = $(this).data('id');
                $('#parent_id').val(parent_id).trigger('change');
                $('#addModal').modal('show');
            });

            $(document).on('click', '.edit_category', function() {
                var url = $(this).data('url');
                $('#editForm').html('');
                $.ajax({
                    url,
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        edit: true,
                    },
                    success: res => {
                        $('#editForm').html(res.data);
                        $('.select').select2({
                            allowClear: true,
                        });
                        $('#editModal').modal('show');
                    }
                });
            });

            $('#editModal').on('hidden.bs.modal', function() {
                $('#editForm').html('');
            });

            $(document).on('click', '.delete_category', function(e) {
                e.preventDefault();
                const url = $(this).data('url');
                const id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!',
                    cancelButtonText: 'No, cancel!',
                    reverseButtons: true
                }).then(result => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url,
                            type: 'POST',
                            data: {
                                _method: 'DELETE',
                                parmanent: true
                            },
                            success: res => {
                                showToast(res.status === 'success' ? 'Deleted!' :
                                    'Failed!', res.message || '', res.status);
                                $('#categoryItem' + id).remove();
                            }
                        });
                    }
                });
            });

            function showToast(title, text, icon = 'success') {
                Swal.fire({
                    width: "22rem",
                    position: 'top-right',
                    toast: true,
                    text,
                    icon,
                    showConfirmButton: false,
                    timer: 1500,
                    showClass: {
                        popup: `animate__animated animate__bounceInRight animate__faster`
                    },
                    hideClass: {
                        popup: `animate__animated animate__bounceOutRight animate__faster`
                    }
                });
            }
        });
    </script>
@endpush
