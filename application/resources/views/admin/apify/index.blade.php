@extends('admin.layouts.app')
@section('panel')
<div class="row mb-4">
    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.apify.token.update') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label>@lang('Apify Token')</label>
                        <input type="text" class="form-control" name="apify_token" value="{{ $general->apify_token }}">
                    </div>
                    <div class="form-group text-end mt-3">
                        <button type="submit" class="btn btn--primary">@lang('Update Token')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title m-0">@lang('Actors')</h5>
                <button class="btn btn-sm btn--primary float-end addBtn">@lang('Add New')</button>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Actor ID')</th>
                                <th>@lang('Metric')</th>
                                <th>@lang('Value Field')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($actors as $actor)
                            <tr>
                                <td>{{ $actor->name }}</td>
                                <td>{{ $actor->actor_id }}</td>
                                <td>{{ $actor->metric }}</td>
                                <td>{{ $actor->value_field }}</td>
                                <td>
                                     <button class="btn btn-sm btn--primary editBtn" data-id="{{ $actor->id }}" data-name="{{ $actor->name }}" data-actor="{{ $actor->actor_id }}" data-metric="{{ $actor->metric }}" data-value="{{ $actor->value_field }}"><i class="las la-edit"></i></button>
                                    <button class="btn btn-sm btn--danger deleteBtn" data-id="{{ $actor->id }}"><i class="las la-trash"></i></button>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">@lang('No data found')</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            @if($actors->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($actors) }}
            </div>
            @endif
        </div>
    </div>
</div>

{{-- Add Modal --}}
<div id="addModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Add Actor')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.apify.actor.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Name')</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Actor ID')</label>
                        <input type="text" class="form-control" name="actor_id" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Metric')</label>
                        <input type="text" class="form-control" name="metric" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Value Field')</label>
                        <input type="text" class="form-control" name="value_field">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- Edit Modal --}}
<div id="editModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Edit Actor')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form method="POST" id="editForm">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Name')</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Actor ID')</label>
                        <input type="text" class="form-control" name="actor_id" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Metric')</label>
                        <input type="text" class="form-control" name="metric" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Value Field')</label>
                        <input type="text" class="form-control" name="value_field">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- Delete Modal --}}
<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Delete Actor')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.apify.actor.delete') }}" method="POST">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <p>@lang('Are you sure to delete this actor?')</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--danger">@lang('Delete')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    $(document).on('click','.addBtn', function(){
        $('#addModal').modal('show');
    });
    $(document).on('click','.editBtn', function(){
        var modal = $('#editModal');
        modal.find('input[name=name]').val($(this).data('name'));
        modal.find('input[name=actor_id]').val($(this).data('actor'));
        modal.find('input[name=metric]').val($(this).data('metric'));
        modal.find('input[name=value_field]').val($(this).data('value'));
        var action = "{{ url(config('app.admin_prefix').'/apify/actor/update') }}/"+$(this).data('id');
        modal.find('#editForm').attr('action', action);
        modal.modal('show');
    });
    $(document).on('click','.deleteBtn', function(){
        var modal = $('#deleteModal');
        modal.find('input[name=id]').val($(this).data('id'));
        modal.modal('show');
    });
</script>
@endpush