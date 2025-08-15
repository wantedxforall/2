<!doctype html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> {{ $general->siteName(__($pageTitle)) }}</title>
    @include('includes.seo')
    <!-- Bootstrap CSS -->
    <link href="{{ asset('assets/common/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/common/css/all.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('assets/common/css/line-awesome.min.css')}}">

    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/magnific-popup.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/slick.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/odometer.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/animate.min.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/lightcase.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/main.css')}}">
    <link rel="stylesheet" href="{{asset($activeTemplateTrue.'css/custom.css')}}">
    @stack('style')
    @stack('style-lib')
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue.'css/color.php') }}?color={{ $general->base_color }}&secondColor={{ $general->secondary_color }}">
</head>
<body>
    @include($activeTemplate.'components.loader')
<div class="page-wrapper">
    @include($activeTemplate.'components.sidenav')
    <div class="main-wrapper">
        <div class="main-body-wrapper">
            @include($activeTemplate.'components.top_header')
            @yield('content')
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="{{asset('assets/common/js/jquery-3.7.1.min.js')}}"></script>
  <script src="{{asset('assets/common/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/popper.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/slick.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/jquery.magnific-popup.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/odometer.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/viewport.jquery.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/smoothscroll.min.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/lightcase.js')}}"></script>
  <script src="{{asset($activeTemplateTrue.'js/wow.min.js')}}"></script>
  <script src="{{ asset('assets/common/js/ckeditor.js') }}"></script>
  <script src="{{asset($activeTemplateTrue.'js/main.js')}}"></script>

@stack('script-lib')

@stack('script')

@include('includes.plugins')

@include('includes.notify')


<script>
    (function ($) {
        "use strict";

        if ($(".trumEdit")[0]) {
            ClassicEditor
                .create(document.querySelector('.trumEdit'))
                .then(editor => {
                    window.editor = editor;
                });
        }

        $(".langSel").on("change", function() {
            window.location.href = "{{route('home')}}/change/"+$(this).val() ;
        });

    })(jQuery);
</script>

</body>
</html>
