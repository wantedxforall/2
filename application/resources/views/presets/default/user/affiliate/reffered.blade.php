@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="dashboard-card-wrap mt-0">
                    <div class="row gy-4">
                        <div class="col-12">
                            <div class="input-group">
                                <input type="text" class="form-control form--control rounded-custom" name="reffer_link"
                                    id="validationCustomUsername" placeholder="@lang('Username')" aria-describedby="inputGroupPrepend"
                                    required value="{{ route('home') }}?reference={{ $user->username }}" readonly>

                                <button type="button" class="input-group-text btn btn--base copytext" id="inputGroupPrepend"
                                    style="border-radius: 0px;"> <i class="fa fa-copy"></i> </button>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="border-box user-profile">
                                <form action="{{ route('user.refferlink.send') }}" method="POST" class="mb--16">
                                    @csrf
                                    <input type="hidden" name="reffer_link"
                                        value="{{ route('home') }}?reference={{ $user->username }}">

                                    <div class="form-group mb-3">
                                        <label class="mb-3">@lang('Email to send Reffer Link')</label>
                                        <input type="email" class="form--control" class="rounded" name="email"
                                            placeholder="@lang('Email')" required>
                                    </div>

                                    <div class="form-group text-right">
                                        <button type="submit" class="btn btn--base">@lang('Send Mail')</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
    <script>
        (function() {
            'use strict';
            var copyButton = document.querySelector('.copytext');
            var copyInput = document.querySelector('.rounded-custom');
            copyButton.addEventListener('click', function(e) {
                e.preventDefault();
                var text = copyInput.select();
                document.execCommand('copy');
            });
            copyInput.addEventListener('click', function() {
                this.select();
            });
        })();
    </script>
@endpush

