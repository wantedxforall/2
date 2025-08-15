@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('Image')</th>
                                <th>@lang('Ad Name')</th>
                                <th>@lang('Ad Title')</th>
                                <th>@lang('Redirect URL')</th>
                                <th>@lang('Script')</th>
                                <th>@lang('Code')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($ads as $ad)
                            <tr>
                                <td data-label="@lang('Image')">
                                    <img src="{{ getImage(getFilePath('adImage').'/'.@$ad->image)}}" style="width:50px; height:50px; border-radius:50px; overflow: hidden;" alt="@lang('ad image')">
                                </td>
                                <td data-label="@lang('Ad Name')">{{__($ad->ad_name)}}</td>
                                <td data-label="@lang('Ad Title')">{{__($ad->title)}}</td>
                                <td data-label="@lang('Redirect URL')">
                                    <a href="{{$ad->redirect_url}}" target="_blank">{{__($ad->redirect_url)}}</a>
                                </td>
                                <td>
                                    <div class="copy-script">
                                        <textarea class="ad-text-area lead" id="advertScript{{$ad->id}}" readonly> <div class='MainAdverTiseMentDiv' data-adType="{{Crypt::encryptString($adType->id)}}" data-adid="{{ Crypt::encryptString($ad->id) }}" data-adsize="{{$ad->resolution}}"></div> <script class="adScriptClass" src="{{url('/')}}/assets/ads/ad.js"></script> </textarea>
                                        <button class="btn btn--primary script-copy-btn copyButton{{ $ad->id }}" onclick="copyToClipboard('#advertScript{{$ad->id}}','{{$ad->id}}')"><i class="fas fa-clipboard"></i> @lang('Copy')</button>
                                        <div class="copy-toast t{{$ad->id}} d-none">@lang('Script Copied')!</div>
                                    </div>
                                </td>
                                <td data-label="@lang('Code')"><span class="badge badge--warning" id="codeCell">{{__($ad->code)}}</span></td>

                                <td data-label="@lang('Status')">
                                    @php
                                        echo $ad->statusBadge($ad->status);
                                    @endphp
                                </td>

                                <td data-label="Action">
                                    <button type="button" class="btn btn-sm btn--primary edit"
                                            data-id = "{{$ad->id}}"
                                            data-title = "{{$ad->title}}"
                                            data-redirect_url = "{{$ad->redirect_url}}"
                                            data-status="{{$ad->status}}">
                                        <i class="las la-edit text--shadow"></i>
                                    </button>

                                    <button type="button" class="btn btn-sm btn--danger deletebtn" data-id="{{$ad->id}}">
                                        <i class="las la-trash text--shadow"></i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{__($emptyMessage)}}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>
            @if ($ads->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($ads) }}
            </div>
            @endif
        </div><!-- card end -->
    </div>
</div>


<!--add modal-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form action="{{route('admin.ad.store')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="ad_type_id" value="{{$adType->id }}">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('Add')</h5>
                    <button type="button" class="close btn btn-outline--danger" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="ad_type_id"> @lang('Ad Type'):</label>
                        <input type="ad_type_id" class="form-control" value="{{$adType->name }}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="title"> @lang('Title'):</label>
                        <input type="text" class="form-control" placeholder="@lang('Title')"
                                name="title" value="{{ old('title') }}" required>
                    </div>

                    <div class="form-group">
                        <label for="url"> @lang('Redirect URL')</label>
                        <input type="text" class="form-control" placeholder="@lang('Redirect URL')"
                                name="url" value="{{ old('url') }}" required>
                    </div>

                    <div class="form-group">
                        <label for="image">@lang('Image') (<span>{{$adType->slug}}</span>)</label>
                        <div class="file-upload-wrapper" data-text="@lang('Select your image!')">
                            <input type="file" name="image"
                                class="file-upload-field" required />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Submit')</button>
                </div>
            </div>
        </form>

    </div>
</div>

<!--edit modal-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form action="{{route('admin.ad.update')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="id">
            <input type="hidden" name="ad_type_id" value="{{$adType->id }}">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('Update')</h5>
                    <button type="button" class="close btn btn-outline--danger" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                  <div class="modal-body">
                    <div class="form-group">
                        <label  for="ad_type_id"> @lang('Ad Type'):</label>
                        <input type="ad_type_id" class="form-control" value="{{$adType->name }}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="title"> @lang('Title'):</label>
                        <input type="text" class="form-control" placeholder="@lang('Title')"
                                name="title" value="title" value="{{ old('title') }}" required>
                    </div>

                    <div class="form-group">
                        <label for="url"> @lang('Redirect URL')</label>
                        <input type="text" class="form-control" placeholder="@lang('Redirect URL')"
                                name="url" value="{{ old('url') }}" required>
                    </div>

                    <div class="form-group">
                        <label for="image">@lang('Image')(<span>{{$adType->slug}}</span>)</label>
                        <div class="file-upload-wrapper" data-text="@lang('Select your image!')">
                            <input type="file" name="image"
                                class="file-upload-field" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="status">@lang('Status')</label>
                        <select id="status" name="status" class="form-control">
                            <option @if(1) selected @endif value="1">@lang('Active')</option>
                            <option @if(0) selected @endif value="0">@lang('Inactive')</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary">@lang('Update')</button>
                </div>
            </div>
        </form>
    </div>
</div>

{{-- delete modal --}}
<div id="rejectModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Ad Delete Confirmation')</h5>
                <button type="button" class="close btn btn--danger" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.ad.delete') }}" method="POST">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <p>@lang('Are you sure you want to delete this ad?')
                    </p>
                </div>
                <div class="modal-footer">
                    <div class="buttorn_wrapper">
                        <button type="submit" class="btn btn--primary"> @lang('Delete')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('breadcrumb-plugins')
    <button type="button" class="btn btn--primary addModal" data-toggle="modal"><i
            class="fas fa-plus"></i>
        @lang('Add new')
    </button>
@endpush


@push('script')
<script>

    (function () {
         'use strict';

            $('.addModal').on('click', function() {
                $('#addModal').modal('show');
            });

            $('.deletebtn').on('click', function() {
                var modal = $('#rejectModal');
                modal.find('input[name=id]').val($(this).data('id'));
                modal.modal('show');
            });


            var modal = $('#editModal');
            $('.edit').on('click', function () {

                var title = $(this).data('title');
                var redirect_url = $(this).data('redirect_url');
                var status = $(this).data('status');
                var id = $(this).data('id');

                modal.find('input[name=id]').val(id)
                modal.find('input[name=title]').val(title)
                modal.find('input[name=url]').val(redirect_url)
                modal.find('#status').val(status);
                modal.modal('show')
            })

            // code copy
            codeCell.addEventListener('click', function() {
                // Create a temporary input element
                var tempInput = document.createElement('input');
                document.body.appendChild(tempInput);
                tempInput.value = codeCell.textContent.trim();
                tempInput.select();
                document.execCommand('copy');
                document.body.removeChild(tempInput);
                Toast.fire({
                    icon: 'success',
                    title: 'Copied to code'
                    })
            });

    }) ();

    function copyToClipboard(element, id) {
        'use strict'

        $(`.t${id}`).removeClass('d-none');
        var $temp = $("<textarea>");
        $("body").append($temp);
        $temp.val($(element).text()).select();
        document.execCommand("copy");
        $temp.remove();

        $(`.t${id}`).addClass('copy-toast').toast('show');

        setTimeout(function() {
            $(`.t${id}`).removeClass('copy-toast').addClass('d-none');
        }, 1000);
    }

</script>
@endpush


