@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
$banner = getContent('banner.content', true);
@endphp
<!--========================== Banner Section Start ==========================-->
<section class="banner-section">
    <div class="shape1 d-lg-block d-none">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path fill-opacity="1"
                d="M0,192L24,192C48,192,96,192,144,181.3C192,171,240,149,288,128C336,107,384,85,432,112C480,139,528,213,576,229.3C624,245,672,203,720,176C768,149,816,139,864,128C912,117,960,107,1008,122.7C1056,139,1104,181,1152,197.3C1200,213,1248,203,1296,186.7C1344,171,1392,149,1416,138.7L1440,128L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z">
            </path>
        </svg>
    </div>
    <div class="shape2 d-lg-block d-none">
        <img src="{{ asset($activeTemplateTrue . 'images/banner/banner3.png') }}" alt="@lang('image')">
    </div>
    <div class="shape3">
        <img src="{{ asset($activeTemplateTrue . 'images/banner/banner4.png') }}" alt="@lang('image')">
    </div>
    <div class="banner-thumb">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-7 col-12 my-auto wow animate__animated animate__fadeInLeft" data-wow-delay="0.6s">
                    <div class="content">
                        <h6>{{__(@$banner->data_values->top_heading)}}<i class="fas fa-arrow-right"></i></h6>
                        <h3>{{__(@$banner->data_values->heading)}}</h3>
                        <p>{{__(@$banner->data_values->sub_heading)}}</p>
                        <div class="action">
                            <a href="{{route('user.login')}}" class="btn btn--base">@lang('Get Started') <i
                                    class="fas fa-arrow-right"></i></a>
                            <a href="{{url('/about')}}" class="btn btn--base d-md-block d-none">@lang('Learn More') <i
                                    class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-12 wow animate__animated animate__fadeInRight" data-wow-delay="0.6s">
                    <img src="{{ getImage(getFilePath('frontend') . '/'.'banner/' . @$banner->data_values->banner_image) }}"
                        class="img-fluid" alt="@lang('image')">
                </div>
            </div>
        </div>
    </div>
</section>
<!--========================== Banner Section End ==========================-->

@if($sections->secs != null)
@foreach(json_decode($sections->secs) as $sec)
@include($activeTemplate.'sections.'.$sec)
@endforeach
@endif
@endsection
