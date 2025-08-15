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
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two custom-data-table">
                        <thead>
                            <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Price')</th>
                                <th>@lang('Credits')</th>
                                <th>@lang('Time')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($plans as $plan)
                            <tr>
                                <td>{{ $plan->name }}</td>
                                <td>{{ showAmount($plan->price) }}</td>
                                <td>{{ $plan->credits }}</td>
                                <td>{{ showDateTime($plan->created_at) }}</td>

                                <td>
                                    @php
                                        echo $plan->statusBadge($plan->status);
                                    @endphp
                                </td>


                                <td>
                                    <a href="{{route('admin.plan.edit',$plan->id)}}" title="@lang('Edit')"
                                     data-id="{{$plan->id}}"
                                        class="btn btn-sm btn--primary ">
                                        <i class="las la-edit"></i>
                                    </a>
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
            @if ($plans->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($plans) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>

@endsection

@push('breadcrumb-plugins')
<a href="{{route('admin.plan.create')}}" class="btn btn-sm btn--primary">@lang('Add Plan')</a>
@endpush

@push('script')
<script>
    $('.rejectBtn').on('click', function () {
            var modal = $('#rejectModal');
            modal.find('input[name=id]').val($(this).data('id'));
            modal.modal('show');
        });
</script>
@endpush

