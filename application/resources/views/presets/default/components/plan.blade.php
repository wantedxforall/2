<div class="row gy-4 justify-content-center  wow animate__animated animate__fadeInUp" data-wow-delay="0.6s">
    @foreach($plans as $plan)
    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
        <div class="card">
            <div class="top">
                <h5>{{__(@$plan->name)}}</h5>
            </div>
            <div class="price">
                <h2><span>{{$general->cur_sym}}</span>{{showAmount($plan->price)}}</h2>
            </div>
            <div class="details">
                <p> <i class="fas fa-check-circle"></i> {{__($plan->credits)}} @lang('Credits Per Post')</p>
                @if(@$plan->content)
                @foreach(json_decode(@$plan->content) as $value)
                <p> <i class="fas fa-check-circle"></i> {{__($value)}}</p>
                @endforeach
                @endif
            </div>
            <div>
                <a href="{{route('user.payment',$plan->id)}}" class="btn btn--base w-100">@lang('Buy Credits')</a>
            </div>
        </div>
    </div>
    @endforeach
</div>
