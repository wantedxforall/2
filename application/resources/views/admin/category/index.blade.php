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
                                <th>@lang('S/N')</th>
                                <th>@lang('Name')</th>
                                <th>@lang('Actor')</th>
                                <th>@lang('Image')</th>
                                <th>@lang('Min Points')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($categories as $key=>$item)
                            <tr>
                                <td>{{$key+1}}</td>
                                <td>{{__($item->name)}}</td>
                                <td>{{ @$item->actor->name }}</td>
                                <td> <img src="{{ getImage(getFilePath('category').'/'.@$item->image)}}" class="rounded" alt="@lang('image')" style="width:32px"> </td>
                                <td>{{ $item->min_points }}</td>
                                <td> @php echo $item->statusBadge($item->status); @endphp </td>
                                <td>
                                    <button title="@lang('Edit')"
                                       data-id="{{$item->id}}" data-name ="{{$item->name}}" data-status ="{{$item->status}}" data-min_points="{{$item->min_points}}" data-actor_id="{{$item->apify_actor_id}}" class="btn btn-sm btn--primary editBtn">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{__($emptyMessage) }}</td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>
            @if ($categories->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($categories) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>

{{-- add modal --}}
<div id="addCategoryModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Add Category')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{route('admin.category.store')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="">@lang('Name')</label>
                            <input type="text" class="form-control" name="name" placeholder="@lang('Name')" required>
                        </div>
                        <div class="form-group">
                            <label for="price" class="font-weight-bold">@lang('Image')</label>
                            <div class="file-upload-wrapper" data-text="@lang('Select your image!')">
                                <input type="file" name="image" id="image"
                                    class="file-upload-field" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">@lang('Min Points')</label>
                            <input type="number" class="form-control" name="min_points" min="0" value="0" required>
                        </div>
                         <div class="form-group">
                            <label for="">@lang('Apify Actor')</label>
                            <select name="apify_actor_id" class="form-control">
                                <option value="">@lang('None')</option>
                                @foreach($actors as $actor)
                                    <option value="{{$actor->id}}">{{__($actor->name)}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- edit modal --}}
<div id="editModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Update Category')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{route('admin.category.update')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" id="">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="">@lang('Name')</label>
                            <input type="text" class="form-control" name="name" placeholder="@lang('Name')" required>
                        </div>
                        <div class="form-group">
                            <label for="price" class="font-weight-bold">@lang('Image')</label>
                            <div class="file-upload-wrapper" data-text="@lang('Select your image!')">
                                <input type="file" name="image" id="image"
                                    class="file-upload-field">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">@lang('Min Points')</label>
                            <input type="number" class="form-control" name="min_points" min="0" required>
                        </div>
                         <div class="form-group">
                            <label for="">@lang('Apify Actor')</label>
                            <select name="apify_actor_id" class="form-control">
                                <option value="">@lang('None')</option>
                                @foreach($actors as $actor)
                                    <option value="{{$actor->id}}">{{__($actor->name)}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">@lang('Status')</label>
                            <select id="status" name="status" class="form-control">
                                <option @if(1) selected @endif value="1">@lang('Active')</option>
                                <option @if(0) selected @endif value="0">@lang('Inactive')</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>

@push('breadcrumb-plugins')
<a href="javascript:void(0)" class="btn btn-sm btn--primary addCategoryBtn">@lang('Add Category')</a>
@endpush

@endsection

@push('script')
<script>

$('.addCategoryBtn').on('click', function () {
    var modal = $('#addCategoryModal');
    modal.modal('show');
});

$('.editBtn').on('click', function () {
    var modal = $('#editModal');
    modal.find('input[name=id]').val($(this).data('id'));
    modal.find('input[name=name]').val($(this).data('name'));
    var status = $(this).data('status');
    modal.find('select[name=status]').val(status);
    modal.find('input[name=min_points]').val($(this).data('min_points'));
    modal.find('select[name=apify_actor_id]').val($(this).data('actor_id'));
    modal.modal('show');
});

</script>
@endpush


