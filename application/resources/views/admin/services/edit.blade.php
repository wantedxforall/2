@extends('admin.layouts.app')
@section('panel')

<div class="row mb-none-30">
    <div class="col-lg-12 mb-30">
        <div class="card">
            <div class="card-body">
                <form action="{{route('admin.service.update',$service->id)}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row mb-3">
                        <div class="col-lg-12">
                            <div class="col-lg-2">
                                <label class="fw-bold">@lang('Status')</label>
                                <label class="switch m-0">
                                    <input type="checkbox" class="toggle-switch" name="status" {{ $service->status ==1 ?
                                    'checked' : null }}>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="name" class="font-weight-bold">@lang('Name')</label>
                                <input type="text" name="name" id="name" value="{{$service->name}}" class="form-control" placeholder="@lang('Name')" required>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="name" class="font-weight-bold">@lang('Category')</label>
                                <select class="form-control" name="category" required>
                                @foreach ($categories as $category)
                                <option value="{{ $category->id }}" {{ $service->category_id == $category->id ? 'selected' : '' }}>
                                    {{ __($category->name) }} @if($category->actor) ({{ $category->actor->name }}) @endif
                                </option>
                                @endforeach
                                </select>
                            

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="link" class="font-weight-bold">@lang('Link')</label>
                                <input type="text" name="link" id="link" value="{{$service->link}}" class="form-control" placeholder="@lang('Link')" required>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="allocated_credits" class="font-weight-bold">@lang('Credits Per Click')</label>
                                <input type="number" name="allocated_credits" id="allocated_credits" value="{{ old('allocated_credits', $service->allocated_credits) }}" class="form-control" required>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="link_description" class="font-weight-bold">@lang('Link Description')</label>
                                <textarea class="trumEdit" name="link_description" cols="30" rows="10" placeholder="@lang('Enter your link description')">@php echo $service->link_description; @endphp</textarea>
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="form-group float-end p-3">
                                <button type="submit" class="btn btn--primary btn-block btn-lg"> @lang('Update')</button>
                            </div>
                        </div>
                 </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('breadcrumb-plugins')
<a href="{{route('admin.service.index')}}" class="btn btn-sm btn--primary box--shadow1 text--small"><i class="las la-angle-double-left"></i>@lang('Go Back')</a>
@endpush

