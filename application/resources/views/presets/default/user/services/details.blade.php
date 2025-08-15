@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <div class="body-area">
                    <h4>{{__($service->name)}}</h4>
                    <p>@php echo $service->link_description; @endphp</p>

                    <div class="d-sm-flex justify-content-between py-5 px-5">
                        <div class="text-center mb-3 mb-sm-0">
                            <a href="{{$service->link}}" class="category-image pages-link" title="@lang('Link')" onclick="openInNewTab('{{$service->link}}', 'test'); return false;">
                                <img src="{{ getImage(getFilePath('category').'/'.$service->category->image)}}" alt="@lang('image')">
                            </a>
                            <p class="mt-2 text--danger">@lang('Earn Credits') {{$service->allocated_credits}}</p>
                        </div>

                        <div class="text-center report">
                            <a href="javascript:void(0)" class="category-image reportBtn" title="Report">
                                <img src="{{ asset($activeTemplateTrue . 'images/report.jpg') }}" alt="@lang('image')" style="width:38px">
                            </a>
                            <p class="mt-2 text--danger">@lang('Report a Problem')</p>
                        </div>
                    </div>

                    <div id="social-check-start" class="text-center my-3 d-none">
                        <p>@lang('Current followers'): <span id="followers-before"></span></p>
                    </div>

                    @if(session('social_check'))
                        <div class="alert alert-info text-center">
                            @lang('Before'): {{ session('social_check.followers_before') }},
                            @lang('After'): {{ session('social_check.followers_after') }},
                            @lang('Difference'): {{ session('social_check.difference') }},
                            @lang('Status'): {{ session('social_check.status') }}
                        </div>
                    @endif

                    <div class="credits-earn-form mb-5 d-none">
                        <form action="{{route('user.post.confrim')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="service_id" value="{{$service->id}}">
                           <div class="form-group text-center">
                                <button type="submit" class="btn btn--base complete-task w-100">@lang('Confirm')</button>
                           </div>
                        </form>
                    </div>

                    <div class="text-center">
                        <a href="{{route('user.plan')}}" class="btn btn--primary outline">@lang('Buy Credits') <i class="fa-solid fa-cart-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="body-area">
                    <h4 class="text-center">#@lang('Credits')</h4>
                    <h3 class="text-center">{{$user->credits}}</h3>
                    <p>
                        @lang('Every time your content gets liked, followed, viewed, subscribed, you lose credits. If you run out of credits, you will no longer receive promotions. You can always earn more FREE credits on our earn pages or you can')
                        <a href="{{route('user.plan')}}" class="text--base fw-bold ">@lang('buy it')</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="reportModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Report Form')</h5>
                <button type="button" class="close btn btn--sm btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{route('user.post.report')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="service_id" value="{{$service->id}}">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios1" value="Can not Earn Credits (System Problem)" checked>
                            <label class="form-check-label" for="exampleRadios1"> @lang('Can not Earn Credits (System Problem)') </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios2" value="Can not Earn Credits (No Button)">
                            <label class="form-check-label" for="exampleRadios2">  @lang('Can not Earn Credits (No Button)')</label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios3" value="Broken Link / No Page">
                            <label class="form-check-label" for="exampleRadios3"> @lang('Broken Link / No Page')</label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios4" value="Porn / Nudity Content">
                            <label class="form-check-label" for="exampleRadios4"> @lang('Porn / Nudity Content')</label>
                          </div>

                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios5" value="Violence / Discriminatory / Unlawful">
                            <label class="form-check-label" for="exampleRadios5"> @lang('Violence / Discriminatory / Unlawful')</label>
                          </div>

                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="report" id="exampleRadios6" value="Other">
                            <label class="form-check-label" for="exampleRadios6"> @lang('Other ')</label>
                          </div>

                          <p class="py-3">@lang('Select one of the report reasons, and click on a "Report" button to complete the submission.')</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--base">@lang('Report')</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection



@push('script')
<script>

"use strict";

$('.reportBtn').on('click', function () {
    var modal = $('#reportModal');
    modal.modal('show');
});


var startUrl = "{{ route('user.social.check.start') }}";

$('.pages-link').on('click', function () {
    var report = $('.credits-earn-form');
    report.removeClass('d-none');
    $.ajax({
        type: 'POST',
        url: startUrl,
        data: {
            _token: '{{ csrf_token() }}',
            service_id: '{{ $service->id }}'
        },
        success: function (data) {
            $('#followers-before').text(data.followers);
            $('#social-check-start').removeClass('d-none');
        }
    });
});


function openInNewTab(url, windowName) {
        let params = `scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=600,height=300,left=100,top=100`;
        window.open(url, windowName, params);
    }

</script>
@endpush
