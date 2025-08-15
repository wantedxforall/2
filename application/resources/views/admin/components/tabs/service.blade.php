<div class="row">
    <div class="col">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link {{ Request::routeIs('admin.service.index') ? 'active' : '' }}"
                    href="{{route('admin.service.index')}}">@lang('All')
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ Request::routeIs('admin.service.active') ? 'active' : '' }}"
                    href="{{route('admin.service.active')}}">@lang('Active')
                    @if($activeServiceCount)
                    <span class="badge rounded-pill bg--white text-muted">{{$activeServiceCount}}</span>
                    @endif
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ Request::routeIs('admin.service.pending') ? 'active' : '' }}"
                    href="{{route('admin.service.pending')}}">@lang('Pending')
                    @if($pendingServiceCount)
                    <span class="badge rounded-pill bg--white text-muted">{{$pendingServiceCount}}</span>
                    @endif
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ Request::routeIs('admin.service.ban') ? 'active' : '' }}"
                    href="{{route('admin.service.ban')}}">@lang('Ban')
                    @if($banServiceCount)
                    <span class="badge rounded-pill bg--white text-muted">{{$banServiceCount}}</span>
                    @endif
                </a>
            </li>
        </ul>
    </div>
</div>
