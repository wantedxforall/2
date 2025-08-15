@extends('admin.layouts.master')
@section('content')
<div class="login_area">
    <div class="login">
        <div class="login__header">
            <h2>{{ __($pageTitle) }}</h2>
            <p>{{ __($general->site_name) }} @lang('Dashboard')</p>
        </div>
        <div class="login__body">
            <h3 class="text-center text-danger">@lang('You are banned')</h3>
        </div>
    </div>
</div>
@endsection