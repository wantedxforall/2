@extends($activeTemplate.'layouts.master')

@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row gy-4">
            <div class="col-lg-6">
                <form action="{{ route('user.withdraw.store') }}" method="POST">
                    @csrf

                    {{-- ✅ رقم الهاتف --}}
                    <div class="mb-3">
                        <label for="phone" class="form-label">@lang('Phone')</label>
                        <input type="number" name="phone" id="phone" class="form-control"
                            value="{{ old('phone') }}" placeholder="@lang('Enter phone number')" required>
                    </div>


                    {{-- المبلغ --}}
                    <div class="mb-3">
                        <label for="credits" class="form-label">@lang('Credits')</label>
                        <input type="number" step="any" name="credits" id="credits" class="form-control"
                            value="{{ old('credits') }}" required>
                    </div>

                    <button type="submit" class="btn btn--base w-100">@lang('Request Withdraw')</button>
                </form>
            </div>
        </div>

        @include($activeTemplate.'user.withdraw.index')
    </div>
</div>
@endsection
