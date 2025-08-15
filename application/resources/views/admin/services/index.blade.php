@extends('admin.layouts.app')
@section('panel')
<div class="d-flex flex-wrap justify-content-end mb-3">
    <div class="d-inline">
        <div class="input-group justify-content-end">
            <input type="text" name="search_table" class="form-control bg--white"
                placeholder="@lang('Search')...">
            <button class="btn btn--primary input-group-text"><i class="fa fa-search"></i></button>
        </div>
    </div>
</div>
@include('admin.components.tabs.service')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two custom-data-table">
                        <thead>
                            <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Category')</th>
                                <th>@lang('User')</th>
                                <th>@lang('Link')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($services as $service)
                            <tr>
                                <td>{{__($service->name)}}</td>
                                <td>{{__( @$service->category->name)}}</td>
                                <td>
                                    @if(@$service->user->username)
                                    <a href="{{ route('admin.users.detail', $service->user->id) }}">{{ @$service->user->username }}</a>
                                    @else
                                    <span>@lang('Admin')</span>
                                    @endif
                                </td>
                                <td><a class="btn btn--sm btn--primary" href="{{$service->link}}" target="_blank" title="Link"><i class="fa-solid fa-link"></i></a></td>
                                <td>
                                    @php
                                        echo $service->statusBadge($service->status);
                                    @endphp
                                </td>

                                <td>
                                    <button class="btn btn-sm btn--warning changeStatusBtn" data-id ="{{$service->id}}" data-status="{{$service->status}}" title="Change Status"><i class="fas fa-toggle-off"></i></button>
                                    <a href="{{route('admin.service.edit',$service->id)}}" title="@lang('Edit')" class="btn btn-sm btn--primary "> <i class="las la-edit"></i> </a>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>
            @if ($services->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($services) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>

{{-- status change modal --}}
<div id="changeStatusModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Status Change Confirmation')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form action="{{route('admin.service.change.status')}}" method="post">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Status')</label>
                        <select name="status" class="form-control">
                            <option @if(1) selected @endif value="1">@lang('Active')</option>
                            <option @if(0) selected @endif value="0">@lang('Pending')</option>
                            <option @if(3) selected @endif value="3">@lang('Ban')</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="buttorn_wrapper">
                        <button type="submit" class="btn btn--primary"> @lang('Change')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('breadcrumb-plugins')
<a href="{{route('admin.service.create')}}" class="btn btn-sm btn--primary">@lang('Add Service')</a>
@endpush

@push('script')
<script>
    (function ($) {
            "use strict";

            $('.changeStatusBtn').on('click', function () {
                var modal = $('#changeStatusModal');
                modal.find('input[name=id]').val($(this).data('id'));
                var status = $(this).data('status');
                 modal.find('select[name=status]').val(status);
                modal.modal('show');
            });

        })(jQuery);

</script>
@endpush


