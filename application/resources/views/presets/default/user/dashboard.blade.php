@extends($activeTemplate.'layouts.master')

@section('content')

@php
    $user  = auth()->user();
    $spent = (int) ($user->credits ?? 0);

    // المستويات الفعّالة مرتّبة من الأقل للأعلى
    $levels = \App\Models\Level::where('is_active', 1)
        ->orderBy('min_points_spent')
        ->get();

    // المستوى الحالي واللاحق
    $currentLevel = $levels->where('min_points_spent', '<=', $spent)->last();
    $nextLevel    = $levels->firstWhere('min_points_spent', '>', $spent);

    $from = (int) ($currentLevel->min_points_spent ?? 0);
    $to   = $nextLevel->min_points_spent ?? null;

    if (is_null($to) || $to <= $from) {
        // وصل لأعلى مستوى
        $progress     = 100;
        $pointsToNext = 0;
        $segmentTotal = max(1, $spent - $from);
        $segmentNow   = $segmentTotal;
    } else {
        $progress     = (int) round((($spent - $from) / max(1, $to - $from)) * 100);
        $progress     = max(0, min(100, $progress));
        $pointsToNext = max(0, $to - $spent);
        $segmentTotal = max(1, $to - $from);
        $segmentNow   = max(0, $spent - $from);
    }
@endphp

<div class="body-wrapper">
    <div class="table-content">

        {{-- بطاقات الإحصائيات --}}
        <div class="row gy-4 mb-4">
            @include('includes.credits_alert')

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="javascript:void(0)" class="d-flex justify-content-between">
                        <div>
                            <div><p>@lang('Total Balance')</p></div>
                            <div class="content">
                                <span class="text-uppercase">{{$general->cur_sym}}{{showAmount(auth()->user()->balance)}}</span>
                            </div>
                        </div>
                        <div class="icon my-auto"><i class="fas fa-money-check-alt"></i></div>
                    </a>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('user.plan')}}" class="d-flex justify-content-between">
                        <div>
                            <div><p>@lang('Total Credits')</p></div>
                            <div class="content">
                                <span class="text-uppercase">#{{auth()->user()->credits}}</span>
                            </div>
                        </div>
                        <div class="icon my-auto"><i class="fa-regular fa-credit-card"></i></div>
                    </a>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('user.service.index')}}" class="d-flex justify-content-between">
                        <div>
                            <div><p>@lang('Total Posts')</p></div>
                            <div class="content"><span class="text-uppercase">{{$widget['total_services']}}</span></div>
                        </div>
                        <div class="icon my-auto"><i class="fa-solid fa-newspaper"></i></div>
                    </a>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                <div class="dash-card">
                    <a href="{{route('user.service.pending')}}" class="d-flex justify-content-between">
                        <div>
                            <div><p>@lang('Pending Posts')</p></div>
                            <div class="content"><span class="text-uppercase">{{$widget['pending_services']}}</span></div>
                        </div>
                        <div class="icon my-auto"><i class="fa-solid fa-newspaper"></i></div>
                    </a>
                </div>
            </div>
        </div>

        {{-- كرت تقدّم المستوى (يوضع فوق تقارير الإيداعات مباشرة) --}}
        <div class="row mb-4">
            <div class="col-lg-12">
                <div class="dash-card p-4">
                    <div class="d-flex align-items-center gap-4 flex-wrap">
                        <div id="level-progress" style="min-width:200px;width:200px;"></div>

                        <div class="flex-grow-1">
                            <h5 class="mb-1">@lang('Level Progress')</h5>

                            <div class="small text-muted mb-3">
                                @lang('Current'):
                                <strong>{{ $currentLevel->name ?? __('No level yet') }}</strong>
                                @if($nextLevel)
                                    &nbsp;•&nbsp; @lang('Next'):
                                    <strong>{{ $nextLevel->name }}</strong>
                                @else
                                    &nbsp;•&nbsp; <strong>@lang('Max level reached')</strong>
                                @endif
                            </div>

                            <div class="d-flex flex-wrap gap-4">
                                <div>
                                    <span class="text-muted d-block">@lang('Points spent')</span>
                                    <strong>{{ number_format($spent) }}</strong>
                                </div>
                                <div>
                                    <span class="text-muted d-block">@lang('This level segment')</span>
                                    <strong>{{ number_format($segmentNow) }} / {{ number_format($segmentTotal) }}</strong>
                                </div>
                                <div>
                                    <span class="text-muted d-block">@lang('To next level')</span>
                                    <strong>{{ number_format($pointsToNext) }}</strong>
                                </div>
                            </div>

                            @if($levels->count())
                                <div class="mt-3">
                                    @foreach($levels as $lvl)
                                        @php $achieved = $spent >= $lvl->min_points_spent; @endphp
                                        <span class="badge {{ $achieved ? 'badge--success' : 'badge--dark' }} me-1 mb-1">
                                            {{ $lvl->name }} ({{ $lvl->min_points_spent }})
                                        </span>
                                    @endforeach
                                </div>
                            @endif
                        </div>

                        @if(!empty($currentLevel?->badge))
                            <div class="ms-auto">
                                <img src="{{ $currentLevel->badge }}" alt="badge" style="height:64px;">
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>

        {{-- مخطط الإيداعات الشهري --}}
        <div class="row mb-4">
            <div class="col-lg-12">
                <div class="chart">
                    <div class="chart-bg">
                        <h4>@lang('Monthly Deposits Reports')</h4>
                        <div id="account-chart"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection


@push('script')
<script src="{{ asset('assets/admin/js/apexcharts.min.js') }}"></script>
<script>
(function () {
  'use strict';

  // ====== رسم دائرة تقدّم المستوى (نص أوضح داخل الدائرة) ======
  var radial = new ApexCharts(document.querySelector("#level-progress"), {
    chart: { type: 'radialBar', height: 240 },
    series: [{{ $progress }}],
    // لا نستخدم labels هنا لتجنّب ظهور كلمة زائدة داخل الدائرة
    plotOptions: {
      radialBar: {
        hollow: { size: '60%' },
        track: { background: '#f2f2f2', strokeWidth: '100%' },
        dataLabels: {
          showOn: 'always',
          value: {
            show: true,
            fontSize: '32px',
            fontWeight: 800,
            offsetY: -8,
            formatter: function (val) { return Math.round(val) + '%'; }
          },
          name: {
            show: true,
            fontSize: '12px',
            offsetY: 28,
            formatter: function () {
              return "{{ $currentLevel?->name ? __('Level').' '.$currentLevel->name : __('No level yet') }}";
            }
          }
        }
      }
    },
    stroke: { lineCap: 'round' },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'light',
        shadeIntensity: 0.3,
        type: 'horizontal',
        gradientToColors: ['#28c76f'],
        stops: [0, 100]
      }
    },
    colors: ['#7367f0']
  });
  radial.render();

  // ====== مخطط الإيداعات الشهري ======
  var options = {
    chart: { type: 'area', stacked: false, height: '310px' },
    stroke: { width: [0, 3], curve: 'smooth' },
    plotOptions: { bar: { columnWidth: '50%' } },
    colors: ['#4430b5', '#ee6f11'], 
    series: [{
      name: '@lang("Deposits")',
      type: 'column',
      data: @json($depositsChart['values'])
    }],
    fill: { opacity: [0.85, 1] },
    markers: { size: 0 },
    xaxis: { type: 'text' },
    yaxis: { min: 0 },
    tooltip: {
      shared: true,
      intersect: false,
      y: {
        formatter: function (y) {
          if (typeof y !== "undefined") { return "$ " + y.toFixed(0); }
          return y;
        }
      }
    },
    legend: {
      labels: { useSeriesColors: true },
      markers: { customHTML: [function(){return ''}, function(){return ''}] }
    }
  };

  var chart = new ApexCharts(document.querySelector("#account-chart"), options);
  chart.render();
})();
</script>
@endpush
