<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ @$admin_setting->title }}</title>

    <link rel="shortcut icon"
        href="{{ asset(file_exists(@$admin_setting->favicon) ? $admin_setting->favicon : 'backend/images/logo/favicon.png') }}"
        type="image/x-icon">

    @notifyCss
    @include('layouts.admin.partial.styles')
    @include('layouts.admin.partial.alert')

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, rgba(15, 32, 39, 0.95), rgba(32, 58, 67, 0.95), rgba(44, 83, 100, 0.95)),
                url("http://127.0.0.1:8080/bg.jpg") center/cover no-repeat;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            animation: fadeInUp .6s ease;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(25px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-title {
            font-weight: 700;
            text-align: center;
            margin-bottom: .5rem;
        }

        .login-subtitle {
            text-align: center;
            font-size: 14px;
            color: rgba(255, 255, 255, .6);
            margin-bottom: 1.8rem;
        }

        .form-label {
            font-size: 14px;
            margin-bottom: .4rem;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: #fff;
            border-radius: 10px;
            padding: .65rem 1rem;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, .5);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.18);
            border-color: #5ddcff;
            box-shadow: 0 0 0 .2rem rgba(93, 220, 255, .25);
            color: #fff;
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggler {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: rgba(255, 255, 255, .7);
            cursor: pointer;
        }

        .form-check-input {
            background-color: transparent;
            border: 1px solid rgba(255, 255, 255, .4);
        }

        .form-check-input:checked {
            background-color: #5ddcff;
            border-color: #5ddcff;
        }

        .btn-login {
            background: linear-gradient(135deg, #5ddcff, #3c67ff);
            border: none;
            border-radius: 12px;
            padding: .7rem;
            font-weight: 600;
            transition: all .3s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(93, 220, 255, .4);
        }

        .forgot-link {
            font-size: 13px;
            color: rgba(255, 255, 255, .6);
            text-decoration: none;
        }

        .forgot-link:hover {
            color: #5ddcff;
        }
    </style>
</head>

<body>

    <div class="login-box">
        <form action="{{ route('admin.login') }}" method="POST">
            @csrf

             <img class="lazyload"
                data-src="{{ asset(file_exists(@$admin_setting->small_logo) ? @$admin_setting->small_logo : 'backend/images/logo/logo.png') }}"
                height="46" width="100%" alt="Logo" style="object-fit: contain;">

            <h2 class="login-title">Admin Login</h2>
            <p class="login-subtitle">Please sign in to continue</p>

            <div class="mb-3">
                <label class="form-label">User Name <span class="text-danger">*</span></label>
                <input type="text" name="user_name" class="form-control"
                    value="{{ old('user_name') }}" required>
            </div>

            <div class="mb-3">
                <div class="d-flex justify-content-between">
                    <label class="form-label">Password <span class="text-danger">*</span></label>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </div>

                <div class="password-wrapper">
                    <input type="password" name="password" id="toggle_password"
                        class="form-control" required>
                    <button type="button" class="password-toggler">
                        <i class="fas fa-eye-slash"></i>
                    </button>
                </div>
            </div>

            <div class="mb-3 form-check">
                <input class="form-check-input" type="checkbox" name="remember" id="remember"
                    {{ old('remember') ? 'checked' : '' }}>
                <label class="form-check-label ms-1" for="remember">Remember me</label>
            </div>

            <button type="submit" class="btn btn-login w-100">
                Sign In
            </button>
        </form>
    </div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleBtn = document.querySelector('.password-toggler');
        const passwordInput = document.getElementById('toggle_password');
        const icon = toggleBtn.querySelector('i');

        toggleBtn.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);

            icon.classList.toggle('fa-eye');
            icon.classList.toggle('fa-eye-slash');
        });
    });
</script>
    @include('layouts.admin.partial.scripts')
    

</body>

</html>
