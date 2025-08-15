
@php
    $plan = getContent('plan.content', true);
    $plans = App\Models\Plan::where('status',1)->latest()->inRandomOrder()->limit(6)->get();
@endphp
<!-- ====================  Buy Credit Start ==================== -->
<section class="buy-credit py-80">
    <div class="container">
        <div class="title">
            <h6>{{__(@$plan->data_values->top_heading)}}</h6>
            <h5>{{__(@$plan->data_values->heading)}}</h5>
            <p>{{__(@$plan->data_values->sub_heading)}}</p>
        </div>
        @include($activeTemplate.'components.plan')
    </div>
</section>
<!-- ====================  Buy Credit End ==================== -->

