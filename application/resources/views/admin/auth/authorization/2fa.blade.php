@extends('admin.layouts.master')
@section('content')
<style>
    .login_area {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f7f8fc;
        padding: 20px;
    }

    .login {
        background: #fff;
        padding: 40px 30px;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }

    .login__header h2 {
        font-size: 24px;
        font-weight: bold;
        color: #2c3e50;
        margin-bottom: 10px;
        text-align: center;
    }

    .login__header p {
        text-align: center;
        font-size: 14px;
        color: #6c757d;
        margin-bottom: 25px;
    }

    .login__body .field {
        margin-bottom: 20px;
        position: relative;
    }

    .login__body input[type="text"] {
        width: 100%;
        padding: 12px 40px 12px 15px;
        font-size: 16px;
        border: 1px solid #ced4da;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    .login__body input[type="text"]:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.1);
    }

    .show-pass {
        position: absolute;
        top: 50%;
        right: 15px;
        transform: translateY(-50%);
        color: #999;
        font-size: 18px;
    }

    .sign-in {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        background-color: #007bff;
        color: #fff;
        transition: background-color 0.3s ease;
    }

    .sign-in:hover {
        background-color: #0056b3;
    }
</style>

<div class="login_area">
    <div class="login">
        <div class="login__header">
            <h2>{{ __($pageTitle) }}</h2>
            <p>{{ __($general->site_name) }} @lang('Dashboard')</p>
        </div>
        <div class="login__body">
            <form action="{{ route('admin.go2fa.verify') }}" method="POST">
                @csrf
                <div class="field">
                    <input type="text" name="code" placeholder="@lang('Google Authenticator OTP')" required>
                    <span class="show-pass"><i class="fas fa-key"></i></span>
                </div>
                <div class="field">
                    <button type="submit" class="sign-in">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
