@extends('layouts.frontend.app')

@section('content')

<style>
.blog-details-section {
    padding: 40px 0;
    background: #f8f9fa;
}

.blog-wrapper {
    background: #fff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 10px 35px rgba(0,0,0,0.08);
}

.blog-wrapper h2 {
    font-weight: 700;
    margin-bottom: 25px;
    font-size: 30px;
}

.blog-image-float {
    float: left;
    width: 45%;
    margin: 0 30px 20px 0;
}

.blog-image-float img {
    width: 100%;
    border-radius: 12px;
}

.blog-content {
    font-size: 16px;
    line-height: 1.9;
    color: #555;
    text-align: justify;
}

/* Mobile */
@media (max-width: 768px) {
    .blog-image-float {
        float: none;
        width: 100%;
        margin: 0 0 20px 0;
    }
}
</style>

<section class="blog-details-section">
    <div class="container">
        <div class="blog-wrapper">

            <h2>{{ $singleDetail->name }}</h2>

            {{-- Float Image --}}
            <div class="blog-image-float">
                <img 
                    src="{{ asset(file_exists($singleDetail->image) ? $singleDetail->image : 'frontend/images/logo.png') }}" 
                    alt="{{ $singleDetail->name }}"
                    loading="lazy"
                    decoding="async">
            </div>

            {{-- Description --}}
            <div class="blog-content">
                {!! $singleDetail->description !!}
            </div>

            <div style="clear: both;"></div>

        </div>
    </div>
</section>

@endsection
