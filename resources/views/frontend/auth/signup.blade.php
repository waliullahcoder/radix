
@extends('layouts.frontend.app')

@section('content')
<div class="contact-form spad">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-80">

            {{-- Left Image --}}
            <div class="col-lg-6 d-none d-lg-block">
                <img src="{{ asset(file_exists($settings->page_heading_bg) ? $settings->page_heading_bg : 'frontend/images/banner-1.png') }}" 
                     alt="Login Image" 
                     class="img-fluid rounded shadow">
            </div>

            {{-- Login Form --}}
            <div class="col-lg-6">
                <div class="card shadow-sm p-4">
                    <div class="contact__form__title text-center mb-4">
                        <h2>Create a new account</h2>
                    </div>

                    <form method="POST" action="">
                        @csrf

                         {{-- Full Name --}}
                        <div class="mb-3">
                            <input type="text"
                                   name="name"
                                   class="form-control @error('name') is-invalid @enderror"
                                   placeholder="Name"
                                   value="{{ old('name') }}"
                                   required>
                            @error('name')
                                <span class="text-danger small">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Email --}}
                        <div class="mb-3">
                            <input type="email"
                                   name="email"
                                   class="form-control @error('email') is-invalid @enderror"
                                   placeholder="Email"
                                   value="{{ old('email') }}"
                                   required>
                            @error('email')
                                <span class="text-danger small">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Password --}}
                        <div class="mb-3">
                            <input type="password"
                                   name="password"
                                   class="form-control @error('password') is-invalid @enderror"
                                   placeholder="Password"
                                   required>
                            @error('password')
                                <span class="text-danger small">{{ $message }}</span>
                            @enderror
                        </div>


                         {{-- Password --}}
                        <div class="mb-3">
                            <input type="password"
                                   name="password_confirmation"
                                   class="form-control @error('password_confirmation') is-invalid @enderror"
                                   placeholder="Password Confirmation"
                                   required>
                            @error('password_confirmation')
                                <span class="text-danger small">{{ $message }}</span>
                            @enderror
                        </div>

                        

                        {{-- Submit --}}
                        <div class="text-center">
                            <button type="submit" class="site-btn w-100">Sign Up</button>
                        </div>

                        {{-- Global Error --}}
                        @if(session('error'))
                            <div class="alert alert-danger mt-3 text-center">
                                {{ session('error') }}
                            </div>
                        @endif

                        {{-- Signup Link --}}
                        <p class="text-center mt-3 mb-0">
                            Already have account?
                            <a href="{{ route('auth.signinPage') }}">Sign In</a>
                        </p>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection



