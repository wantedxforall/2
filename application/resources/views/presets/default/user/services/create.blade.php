@extends($activeTemplate.'layouts.master')
@section('content')

<div class="body-wrapper">
    <div class="table-content">
        @include('includes.credits_alert')
        <div class="row justify-content-end mb-3">
            <div class="col-lg-4 col-md-8 col-12 text-end">
                <a class="btn btn--base btn--sm" href="{{route('user.service.index')}}"> <i class="fas fa-backward"></i>
                    @lang('Back') </a>
            </div>
        </div>
        <div class="body-area">
            <div class="form-body">
                <form role="form" method="POST" action="{{route('user.service.store')}}" enctype="multipart/form-data">
                    @csrf

                    <div class="row gy-4">

                        <div class="form-group col-md-6 col-lg-6 col-xl-4">
                            <label class="form--label">@lang('Name') <span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" value="{{old('name')}}" class="form--control"
                                placeholder="@lang('Name')" required>
                        </div>

                        <div class="form-group col-md-6 col-lg-6 col-xl-4">
                            <label class="form--label">@lang('Category') <span class="text-danger">*</span></label>
                            <select class="form--control" name="category" id="categorySelect" required>
                                @foreach ($categories as $category)
                                <option value="{{$category->id}}" data-min="{{$category->min_points}}">{{__($category->name)}} @if($category->actor) ({{ $category->actor->name }}) @endif</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-md-6 col-lg-6 col-xl-4">
                            <label class="form--label">@lang('Link') <span class="text-danger">*</span></label>
                            <input type="text" name="link" id="link" value="{{old('link')}}" class="form--control"
                                placeholder="@lang('Link')" required>
                        </div>

                        <div class="form-group col-md-6 col-lg-6 col-xl-4">
                            <label class="form--label">@lang('Credits') <span class="text-danger">*</span></label>
                            <input type="number" min="1" name="allocated_credits" id="allocatedCredits" value="{{ old('allocated_credits') }}" class="form--control" required>
                            <small id="minPointsMessage" class="text-muted"></small>
                            @error('allocated_credits')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{--<div class="form-group col-md-12">
                            <label class="form--label">@lang('Link') <span class="text-danger">*</span></label>
                            <textarea class="trumEdit" name="link_description" cols="30" rows="10"
                                placeholder="@lang('Enter your link description')"></textarea>
                        </div>--}}
                    </div>

                    <div class="form-group col-md-12 mt-3 text-end">
                        <button type="submit" class="btn btn--base">@lang('Create')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

@push('script')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const categorySelect = document.getElementById('categorySelect');
        const creditsInput = document.getElementById('allocatedCredits');
        const message = document.getElementById('minPointsMessage');

        function updateMin() {
            const min = categorySelect.options[categorySelect.selectedIndex].dataset.min || 1;
            creditsInput.min = min;
            message.textContent = `{{ __('Minimum credits required:') }} ${min}`;
        }

        categorySelect.addEventListener('change', updateMin);
        updateMin();
    });
</script>
@endpush