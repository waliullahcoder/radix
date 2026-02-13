@extends('layouts.frontend.app')

@section('content')

<style>
.blog-details-section {
    padding: 20px 0;
    background: #f8f9fa;
}

.blog-card {
    background: #ffffff;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 10px 35px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
}

.blog-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 45px rgba(0,0,0,0.12);
}

.blog-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 15px 0 0 15px;
}

.blog-content {
    padding: 40px;
}

.blog-content h2 {
    font-weight: 700;
    margin-bottom: 20px;
    font-size: 28px;
}

.blog-content p {
    line-height: 1.9;
    font-size: 16px;
    color: #555;
    text-align: justify;
}

@media (max-width: 991px) {
    .blog-image img {
        border-radius: 15px 15px 0 0;
    }
}
</style>

<section class="blog-details-section">
    <div class="container">
        <div class="blog-card">
            <div class="row g-0 align-items-center">

                {{-- Image Section --}}
                <div class="col-lg-6">
                    <div class="blog-image h-100">
                        <img 
                            src="{{ asset(file_exists($singleDetail->image) ? $singleDetail->image : 'frontend/images/logo.png') }}" 
                            alt="{{ $singleDetail->name }}"
                            loading="lazy"
                            decoding="async">
                    </div>
                </div>

                {{-- Content Section --}}
                <div class="col-lg-6">
                    <div class="blog-content">
                        <h2>{{ $singleDetail->name }}</h2>
                        <p>{!! $singleDetail->description !!}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

@endsection
