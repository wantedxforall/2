@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.api.generate') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label>@lang('API Key')</label>
                        <div class="input-group">
                            <input type="text" id="apiKeyField" class="form-control" value="{{ $admin->api_token }}" readonly>
                            <button type="button" class="input-group-text copyInput" title="@lang('Copy')"><i class="fa fa-copy"></i></button>
                        </div>
                    </div>
                    <div class="form-group text-end mt-3">
                        <button type="submit" class="btn bg--primary">@lang('Generate New Key')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    $('.copyInput').on('click', function () {
        var copybtn = $(this);
        var input = $('#apiKeyField');
        input.select();
        document.execCommand('copy');
        notify('success', `Copied: ${input.val()}`);
    });
</script>
@endpush