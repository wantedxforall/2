
@php
    $faq = getContent('faq.content', true);
    $faqElements = getContent('faq.element', false, 5);
@endphp
<!-- ==================== FAQ Start ==================== -->
<section class="faq py-80">
    <div class="shape1 d-none d-lg-block">
        <img src="{{ asset($activeTemplateTrue . 'images/shape/shape2.png') }}" alt="@lang('image')">
    </div>
    <div class="shape2  d-none d-lg-block">
        <img src="{{ asset($activeTemplateTrue . 'images/shape/shape1.png') }}" alt="@lang('image')">
    </div>
    <div class="container">
        <div class="title wow animate__animated animate__fadeInDown" data-wow-delay="0.6s">
            <h6>{{__(@$faq->data_values->top_heading) }}</h6>
            <h5>{{__(@$faq->data_values->heading) }}</h5>
        </div>
        <div class="row">
            <div class="col-lg-6 col-12 my-auto mt-4 my-lg-0 wow animate__animated animate__fadeInLeft"
                data-wow-delay="0.6s">
                <div class="accordion custom--accordion" id="accordionExample">
                    @foreach($faqElements as $item)
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading{{ $loop->index }}">
                            <button class="accordion-button {{ $loop->index == 0 ? '' : 'collapsed' }}" type="button"
                                data-bs-toggle="collapse" data-bs-target="#collapse{{ $loop->index }}"
                                aria-expanded="{{ $loop->index == 0 ? 'true' : 'false' }}">
                                {{__(@$item->data_values->question) }}
                            </button>
                        </h2>
                        <div id="collapse{{ $loop->index }}"
                            class="accordion-collapse collapse {{ $loop->index == 0 ? 'show' : '' }}"
                            aria-labelledby="heading{{ $loop->index }}" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                @php echo @$item->data_values->answer; @endphp
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-lg-6 col-12 thumb d-none d-lg-block wow animate__animated animate__fadeInRight"
                data-wow-delay="0.6s">
                <img src="{{ getImage(getFilePath('frontend') . '/'.'faq/' . @$faq->data_values->faq_image) }}" class="d-flex ms-auto" alt="@lang('image')">
            </div>
        </div>
    </div>
</section>
<!-- ==================== FAQ End ==================== -->
