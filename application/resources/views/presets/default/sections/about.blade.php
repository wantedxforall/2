@php
    $about = getContent('about.content', true);
    $aboutElements = getContent('about.element', false);
@endphp
<!-- ====================  info Start ==================== -->
<section class="info py-80">
    <div class="shape1">
        <img src="{{ asset($activeTemplateTrue . 'images/shape/shape1.png') }}" alt="@lang('image')">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-12 wow animate__animated animate__fadeInLeft mb-5 mb-lg-0" data-wow-delay="0.6s">
                <div class="thumb">
                    <img src="{{ getImage(getFilePath('frontend') . '/'.'about/' . @$about->data_values->about_image) }}" alt="@lang('image')">
                </div>
            </div>
            <div class="col-lg-6 col-12 my-auto">
                <div class="title wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
                    <h6>{{__(@$about->data_values->top_heading)}}</h6>
                    <h5>{{__(@$about->data_values->heading)}}</h5>
                    <p>{{__(@$about->data_values->description)}}</p>
                    <a href="{{url('/about')}}" class="btn btn--base mt-4">@lang('About More')</a>
                </div>
            </div>
        </div>
        <div class="row gy-5 mt-5 wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
            @foreach($aboutElements as $item)
            <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                <div class="card">
                    <div class="icon">
                       @php echo $item->data_values->icon; @endphp
                    </div>
                    <div class="content">
                        <h4>{{__(@$item->data_values->title)}}</h4>
                        <p>
                            @if (strlen(__(@$item->data_values->description)) >50)
                            {{ substr(__(@$item->data_values->description), 0, 50) . '...' }}
                            @else
                                {{ __(@$item->data_values->description) }}
                            @endif
                        </p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!-- ====================  info End ==================== -->
