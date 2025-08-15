@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <section class="buy-credit">
        @include($activeTemplate.'components.plan')
        <div class="row mt-5">
            <div class="col-lg-12">
                @if($plans->hasPages())
                <div class="text-end">
                    {{ paginateLinks($plans) }}
                </div>
                @endif
            </div>
        </div>
    </section>
</div>
@endsection
