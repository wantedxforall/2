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
                                <th>@lang('Post Name')</th>
                                <th>@lang('Link')</th>
                                <th>@lang('Reported User')</th>
                                <th>@lang('Report')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($reports as $report)
                            <tr>
                                <td>
                                    <a href="{{route('admin.service.edit',$report->service->id)}}"> {{__(@$report->service->name)}}</a>
                                </td>
                                <td>
                                    <a href="{{@$report->service->link}}" class="btn btn--primary btn-sm" target="_blank" title="@lang('Check Link')">@lang('Check')</a>
                                </td>
                                <td>
                                    <a href="{{ route('admin.users.detail', $report->user->id) }}"> {{@$report->user->username}}</a>
                                </td>
                                <td> {{__($report->report)}} </td>
                                <td>
                                    @if(@$report->service->status == 1)
                                    <button class="btn btn--danger btn-sm banBtn" data-id="{{@$report->service->id}}" title="@lang('Ban')"><i class="fa-solid fa-ban"></i></button>
                                    @else
                                    <a href="{{route('admin.service.edit',$report->service->id)}}" class="btn btn--primary btn-sm" title="@lang('Details')"><i class="fas fa-eye"></i></a>
                                    @endif
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
            @if ($reports->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($reports) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>

{{-- ban modal --}}
<div id="banModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Post Ban Confirmation!')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{route('admin.service.report.ban')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <div class="modal-body">
                        <p>
                            @lang('Are you sure you want to ban this post?')
                        </p>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Confirm')</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('script')
<script>
$('.banBtn').on('click', function () {
    var modal = $('#banModal');
    modal.find('input[name=id]').val($(this).data('id'));
    modal.modal('show');
});

</script>
@endpush



