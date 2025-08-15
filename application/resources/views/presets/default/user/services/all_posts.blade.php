@extends($activeTemplate.'layouts.master')
@section('content')
<style>
    .filter-bar {
        background: rgba(255, 255, 255, 0.85); /* خلفية شبه شفافة */
        backdrop-filter: blur(6px); /* تأثير البلور للخلفية */
        border-radius: 12px; /* حواف ناعمة */
        padding: 15px 20px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08); /* ظل خفيف */
    }
    .filter-bar select,
    .filter-bar button {
        height: 45px;
        font-weight: bold;
    }
    .filter-bar button i {
        margin-right: 5px;
    }
</style>

<form action="{{ route('user.fetch.post') }}" method="GET" class="mb-4">
    <div class="filter-bar">
        <div class="row g-2 justify-content-center">

            {{-- الترتيب --}}
            <div class="col-lg-3 col-md-4 col-sm-12">
                <select name="sort" class="form-select text-center">
                    <option value="points_desc" {{ request('sort') == 'points_desc' ? 'selected' : '' }}>
                        @lang('Highest Points')
                    </option>
                    <option value="points_asc" {{ request('sort') == 'points_asc' ? 'selected' : '' }}>
                        @lang('Lowest Points')
                    </option>
                </select>
            </div>

            {{-- التصنيف --}}
            <div class="col-lg-3 col-md-4 col-sm-12">
                <select name="category" class="form-select text-center">
                    <option value="">@lang('All Categories')</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}" {{ request('category') == $category->id ? 'selected' : '' }}>
                             {{ __($category->name) }} @if($category->actor) ({{ $category->actor->name }}) @endif
                        </option>
                    @endforeach
                </select>
            </div>

            {{-- زر الفلتر --}}
            <div class="col-lg-2 col-md-4 col-sm-12">
                <button type="submit" class="btn btn--base w-100">
                    <i class="fas fa-filter"></i> @lang('Filter')
                </button>
            </div>

        </div>
    </div>
</form>

<div class="body-wrapper">
    <div class="table-content">
        <div class="row gy-4 mb-4">
            @forelse($services as $service)
            @if(!in_array($service->id, $viewed))
            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{ route('user.post.details', ['slug' => slug($service->name), 'id' => $service->id]) }}" class="d-flex justify-content-between">
                        <div>
                            <p>{{__($service->name)}}</p>
                            <p class="mt-1 text--danger">@lang('Earn Credits') {{ $service->allocated_credits }}</p>
                            <p class="text--base">@lang('View') <i class="fa-solid fa-arrow-right"></i></p>
                        </div>
                        <div class="icon service_icon my-auto">
                          <img src="{{ getImage(getFilePath('category').'/'.@$service->category->image)}}" alt="@lang('image')">
                        </div>
                    </a>
                </div>
            </div>
            @endif
            @empty
            <h2 class="text-center">{{__($emptyMessage)}}</h2>
            @endforelse
        </div>
    </div>
</div>
@endsection
