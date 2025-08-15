@extends('admin.layouts.app')

@section('panel')
<div class="row justify-content-center">
    @if(!auth('admin')->user()->ts)
    <div class="col-xl-5 col-lg-5">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">@lang('Add Your Account')</h5>
                <div class="mb-3 text-center">
                    <img src="{{$qrCodeUrl}}" alt="qr" class="mx-auto">
                </div>
                <p>@lang('Use the QR code or setup key on your Google Authenticator app to add your account.')</p>
                <div class="input-group mb-3">
                    <input type="text" name="key" value="{{$secret}}" class="form-control" readonly>
                    <button type="button" class="input-group-text copytext" id="copyBoard"><i class="fa fa-copy"></i></button>
                </div>
            </div>
        </div>
    </div>
    @endif
    <div class="col-xl-7 col-lg-7">
        <div class="card">
            <div class="card-body">
                @if(auth('admin')->user()->ts)
                <h5 class="card-title">@lang('Disable 2FA Security')</h5>
                <form action="{{route('admin.twofactor.disable')}}" method="POST">
                    @csrf
                    <input type="hidden" name="key" value="{{$secret}}">
                    <div class="mb-3">
                        <label class="form-label">@lang('Google Authenticator OTP')</label>
                        <input type="text" class="form-control" name="code" required>
                    </div>
                    <button type="submit" class="btn btn--primary">@lang('Submit')</button>
                </form>
                @else
                <h5 class="card-title">@lang('Enable 2FA Security')</h5>
                <form action="{{route('admin.twofactor.enable')}}" method="POST">
                    @csrf
                    <input type="hidden" name="key" value="{{$secret}}">
                    <div class="mb-3">
                        <label class="form-label">@lang('Google Authenticator OTP')</label>
                        <input type="text" class="form-control" name="code" required>
                    </div>
                    <button type="submit" class="btn btn--primary">@lang('Submit')</button>
                </form>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection

@push('style')
<style>
    .copied::after {
        background-color: #{{$general->base_color}};
    }
</style>
@endpush

@push('script')
<script>
    (function ($) {
        "use strict";
        $('#copyBoard').on('click', function () {
            var copyText = document.querySelector("input[name='key']");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            document.execCommand("copy");
            copyText.blur();
            this.classList.add('copied');
            setTimeout(() => this.classList.remove('copied'), 1500);
        });
    })(jQuery);
</script>
@endpush