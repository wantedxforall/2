@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
$contact = getContent('contact_us.content', true);
$user = auth()->user();
@endphp
<!-- ==================== Contact Form & Map Start ==================== -->
<section class="contact py-80">
    <div class="container">
        {{-- info area  --}}
        <div class="row gy-4 pb-60 justify-content-center wow animate__animated animate__fadeInDown"
        data-wow-delay="0.6s">
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="card">
                    <div class="content">
                        <h5><i class="fas fa-map-marker-alt"></i> @lang('Location')</h5>
                        <p>{{__($contact->data_values->contact_details)}}</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="card">
                    <div class="content">
                        <h5><i class="fas fa-envelope"></i> @lang('Email')</h5>
                        <a href="mailto:{{$contact->data_values->email_address}}">{{__($contact->data_values->email_address)}}</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="card">
                    <div class="content">
                        <h5><i class="fas fa-phone-square"></i> @lang('Phone')</h5>
                        <a href="tel:{{$contact->data_values->contact_number}}">{{__($contact->data_values->contact_number)}}</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="card">
                    <div class="content">
                        <h5><i class="fas fa-headset"></i> @lang('Support')</h5>
                        <p>@lang('24/7 Support')</p>
                    </div>
                </div>
            </div>
        </div>

        {{-- contact form  --}}
        <div class="row gy-4 mt-5">
            <div class="col-lg-5 my-auto  wow animate__animated animate__fadeInLeft" data-wow-delay="0.6s">
                <div class="body">
                <h4 class="contact__title">{{__($contact->data_values->title)}}</h4>
                <form method="post" action="" class="verify-gcaptcha">
                    @csrf
                    <div class="row gy-md-4 gy-3">
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Name')</h6>
                            <input type="text" name="name" id="name" class="form-control form--control"
                                placeholder="@lang('Name')" value="{{ old('name', @$user->fullname) }}" required
                                @if (@$user) readonly @endif>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Email')</h6>
                            <input type="email" name="email" id="email" class="form-control form--control"
                                placeholder="@lang('Email')" value="{{ old('email', @$user->email) }}" require
                                 @if(@$user) readonly @endif>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Subject')</h6>
                            <input type="text" name="subject" id="msg_subject" class="form-control form--control"
                                placeholder="@lang('Subject')" required>
                        </div>
                        <div class="col-sm-12">
                            <h6 class="mb-2">@lang('Message')</h6>
                            <textarea class="form--control" name="message"
                                placeholder="@lang('Write Your Message')">{{ old('message') }}</textarea>
                        </div>
                        <div class="col-sm-12">
                            <x-captcha></x-captcha>
                        </div>
                        <div class="col-sm-12">
                            <button class="btn btn--base" id="recaptcha">@lang('Send Message') <i class="las la-arrow-alt-circle-right"></i></button>
                        </div>
                    </div>
                </form>
               </div>
            </div>
            <div class="col-lg-7 my-auto thumb my-auto  wow animate__animated animate__fadeInRight"
                data-wow-delay="0.6s">
                <div class="mt-4 mt-lg-0">
                    <img src="{{ getImage(getFilePath('frontend') .'/'.'contact_us/'. @$contact->data_values->contact_image) }}" class="img-fiuld d-flex ms-auto" alt="@lang('image')">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==================== Contact Form & Map End ==================== -->
@endsection
