@extends($activeTemplate.'layouts.master')

@section('content')
<div class="body-wrapper">
    <div class="row g-4">
        @foreach($levels as $level)
            <div class="col-xl-3 col-md-4 col-sm-6">
                <div class="card h-100 {{ $currentLevel && $currentLevel->id === $level->id ? 'border-primary shadow' : '' }}">
                    <div class="card-body">
                        <h5 class="card-title">{{ $level->name ?? __('Level') }}</h5>
                        <p class="mb-2">{{ $level->points ?? 0 }} @lang('pts')</p>
                        @if($level->benefits && $level->benefits->count())
                            <ul class="ps-3 mb-0">
                                @foreach($level->benefits as $benefit)
                                    <li>{{ $benefit->name ?? $benefit->description ?? $benefit }}</li>
                                @endforeach
                            </ul>
                        @endif
                        @if($currentLevel && $currentLevel->id === $level->id)
                            <span class="badge bg-primary mt-2">@lang('Current Level')</span>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
    </div>
    @if($nextLevel)
        <div class="mt-4">
            <p>@lang('You need :points more points to reach :level', ['points' => $pointsToNext, 'level' => $nextLevel->name])</p>
        </div>
    @endif
</div>
@endsection