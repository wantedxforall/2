@extends('admin.layouts.app')

@section('panel')
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('Name')</th>
                                    <th>@lang('Benefits')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($levels as $level)
                                    <tr>
                                        <td>{{ $level->name }}</td>
                                        <td>{{ count($level->benefits ?? []) }}</td>
                                        <td>
											@if($level->is_active)
												<span class="badge badge--success">@lang('Active')</span>
											@else
												<span class="badge badge--danger">@lang('Disabled')</span>
											@endif
										</td>

										<td>
											{{-- Edit --}}
											<a href="{{ route('admin.levels.edit', $level->id) }}"
											   class="btn btn-sm btn--primary" title="@lang('Edit')">
												<i class="las la-edit"></i>
											</a>

											{{-- Delete --}}
											<form action="{{ route('admin.levels.destroy') }}"
											  method="POST" class="d-inline"
											  onsubmit="return confirm('@lang('Delete this level? This action cannot be undone.')');">
											@csrf
											<input type="hidden" name="id" value="{{ $level->id }}">
											<button type="submit" class="btn btn-sm btn--danger" title="@lang('Delete')">
												<i class="las la-trash-alt"></i>
											</button>
										</form>

										</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if($levels->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($levels) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.levels.create') }}" class="btn btn-sm btn--primary">@lang('Add Level')</a>
@endpush