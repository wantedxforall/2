@php
$testimonial = getContent('testimonial.content', true);
$testimonialElements = getContent('testimonial.element', false);
@endphp
<!--========================== Testimonial Start ==========================-->
<section class="testimonial py-80">
    <div class="container">
        <div class="title">
            <h6>{{__(@$testimonial->data_values->top_heading)}}</h6>
            <h5>{{__(@$testimonial->data_values->heading)}}</h5>
            <p>{{__(@$testimonial->data_values->sub_heading)}}</p>
        </div>
        <div class="testimonial-slider wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
            @foreach($testimonialElements as $item)
            <div class="card">
                <div class="shape1">
                    <i class="fa-solid fa-quote-right"></i>
                </div>
                <div class="profile d-flex">
                    <div>
                        <img src="{{ getImage(getFilePath('frontend') . '/'.'testimonial/' . @$item->data_values->client_image) }}"
                            alt="@lang('image')">
                    </div>
                    <div>
                        <h5>{{__($item->data_values->name)}}</h5>
                        <p>{{__($item->data_values->designation)}}</p>
                    </div>
                </div>
                <div class="content">
                    <p>
                        @if (strlen(__($item->data_values->description)) >180)
                        {{ substr(__($item->data_values->description), 0, 180) . '...' }}
                        @else
                        {{__($item->data_values->description) }}
                        @endif
                    </p>
                </div>
                <div class="star">
                    @php echo showRatings($item->star_count) @endphp
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--========================== Testimonial End ==========================-->
