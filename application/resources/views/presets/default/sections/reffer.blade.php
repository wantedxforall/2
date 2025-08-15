
@php
    $reffer = getContent('reffer.content', true);
@endphp
<section>
    <div class="container">
        <div class="about">
            <div class="row gy-4">
                <div class="col-lg-6 col-12 my-auto">
                    <div class="about-thumb">
                        <img class="main-img" src="{{ getImage(getFilePath('frontend') . '/'.'reffer/' . @$reffer->data_values->reffer_image) }}" alt="element">
                    </div>
                </div>
                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                    <div class="title">
                        <h5>{{__(@$reffer->data_values->heading)}}</h5>
                        <p>
                            {{ __(@$reffer->data_values->description) }}
                        </p>
                        <div>
                            <a href="{{route('user.login')}}" class="btn btn--base">@lang('SignIn')</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
