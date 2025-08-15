<div class="card level-card">
    <div class="card-body">
        <div class="d-flex align-items-center mb-3">
            @if(isset($currentLevel->badge))
                <img src="{{ $currentLevel->badge }}" alt="{{ $currentLevel->name }}" class="me-3 level-badge">
            @endif
            <div>
                <h5 class="mb-0">{{ __($currentLevel->name ?? '') }}</h5>
                @if(isset($user))
                    <small>@lang('Hi, :name', ['name' => $user->username ?? $user->name ?? ''])</small>
                @endif
            </div>
        </div>

        @if($nextLevel)
            <div class="mb-3">
                <div class="d-flex justify-content-between small mb-1">
                    <span>@lang('Progress to :next', ['next' => __($nextLevel->name)])</span>
                    <span>{{ $progressPercent }}%</span>
                </div>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: {{ $progressPercent }}%;" aria-valuenow="{{ $progressPercent }}" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        @endif

        @if(!empty($activeBenefits))
            <div class="mb-3">
                <h6>@lang('Your Benefits')</h6>
                <ul class="list-unstyled ms-2">
                    @foreach($activeBenefits as $benefit)
                        <li class="d-flex align-items-center mb-1">
                            <span class="badge bg-success me-2">&check;</span>
                            <span>{{ __($benefit) }}</span>
                        </li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if(!empty($allLevels))
            <div class="upcoming-levels">
                <h6>@lang('Upcoming Levels')</h6>
                <div class="row g-2">
                    @foreach($allLevels as $level)
                        @continue(isset($currentLevel->id) && isset($level->id) && $level->id <= $currentLevel->id)
                        <div class="col-6 col-md-4">
                            <div class="text-center border rounded p-2">
                                @if(isset($level->badge))
                                    <img src="{{ $level->badge }}" alt="{{ $level->name }}" class="mb-1 level-badge-sm">
                                @endif
                                <div class="small">{{ __($level->name) }}</div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
    </div>
</div>

@push('style')
<style>
    .level-card .progress{height:6px;}
    .level-card .level-badge{width:48px;height:48px;}
    .level-card .level-badge-sm{width:32px;height:32px;}
</style>
@endpush