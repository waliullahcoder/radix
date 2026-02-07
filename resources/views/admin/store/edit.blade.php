@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-sm-6">
            <label for="code" class="form-label"><b>Code</b></label>
            <input type="text" class="form-control" id="code" name="code" value="{{ old('code', $data->code) }}"
                placeholder="Code">
        </div>
        <div class="col-sm-6">
            <label for="name" class="form-label"><b>Store Name <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $data->name) }}"
                placeholder="Store Name" required>
        </div>
        <div class="col-sm-6">
            <label for="location" class="form-label"><b>Location</b></label>
            <input type="text" class="form-control" id="location" name="location"
                value="{{ old('location', $data->location) }}" placeholder="Location">
        </div>
        <div class="col-sm-6">
            <label for="address" class="form-label"><b>Address</b></label>
            <input type="text" class="form-control" id="address" name="address"
                value="{{ old('address', $data->address) }}" placeholder="Address">
        </div>
        <div class="col-sm-6">
            <label for="remarks" class="form-label"><b>Remarks</b></label>
            <input type="text" class="form-control" id="remarks" name="remarks"
                value="{{ old('remarks', $data->remarks) }}" placeholder="Remarks">
        </div>
    </div>
@endsection
