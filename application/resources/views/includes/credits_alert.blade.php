@if(auth()->check() && auth()->user()->credits <= 0)
    <div class="alert alert-warning alert-dismissible fade show mb-3" role="alert">
        @lang('You have no credits left.') <a href="{{ route('user.plan') }}" class="text--base fw-bold">@lang('Buy or earn credits')</a>
        <button type="button" class="close" data-bs-dismiss="alert" aria-label="@lang('Close')">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif