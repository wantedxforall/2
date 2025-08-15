@php
    $support = getContent('support.content', true);
    $supportElements = getContent('support.element', false);
@endphp
<!-- ====================  Support Social Start ==================== -->
<section class="support-social py-80 bg-img bg-overlay bg-fixed" data-background="{{ asset($activeTemplateTrue . 'images/supportImg.png') }}">
    <div class="container">
        <div class="row gy-4">
            <div class="col-lg-4 col-12 my-auto">
                <div class="title wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
                    <h6>{{__(@$support->data_values->top_heading)}}</h6>
                    <h5>{{__(@$support->data_values->heading)}}</h5>
                    <a href="{{route('user.login')}}" class="btn btn--base mt-4">@lang('Join Now')</a>
                </div>
            </div>
            <div class="col-lg-8 col-12 my-lg-auto mt-4">
                <div class="social-slider">
                    @foreach($supportElements as $item)
                    <div class="card">
                        <div class="icon">
                            <img src="{{ getImage(getFilePath('frontend') . '/'.'support/' . @$item->data_values->support_image) }}" alt="@lang('image')">
                        </div>
                        <div>
                            <h4>{{__(@$item->data_values->title)}}</h4>
                            <p>
                                @if (strlen(__(@$item->data_values->description)) >130)
                                    {{ substr(__(@$item->data_values->description), 0, 130) . '...' }}
                                @else
                                    {{ __(@$item->data_values->description) }}
                                @endif
                            </p>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ====================  Support Social End ==================== -->
