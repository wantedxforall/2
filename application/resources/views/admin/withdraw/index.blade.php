@extends('admin.layouts.app')

@section('panel')
<div class="card-header p-3">
    <form method="GET" class="row g-2 align-items-end">
        <div class="col-md-2">
            <label class="form-label">@lang('Method')</label>
            <select name="method" class="form-select">
                <option value="">@lang('All')</option>
                <option value="phone" {{ request('method')=='phone'?'selected':'' }}>phone ({{ $counts['phone'] ?? 0 }})</option>
                <option value="usdt"  {{ request('method')=='usdt'?'selected':'' }}>usdt ({{ $counts['usdt'] ?? 0 }})</option>
            </select>
        </div>

        <div class="col-md-2">
            <label class="form-label">@lang('Status')</label>
            <select name="status" class="form-select">
                <option value="">@lang('All')</option>
                <option value="pending" {{ request('status')=='pending'?'selected':'' }}>@lang('Pending') ({{ $counts['pending'] ?? 0 }})</option>
                <option value="approved" {{ request('status')=='approved'?'selected':'' }}>@lang('Approved') ({{ $counts['approved'] ?? 0 }})</option>
                <option value="rejected" {{ request('status')=='rejected'?'selected':'' }}>@lang('Rejected')</option>
            </select>
        </div>

        <div class="col-md-3">
            <label class="form-label">@lang('Search (Phone / Binance ID)')</label>
            <input type="text" name="q" value="{{ request('q') }}" class="form-control" placeholder="e.g. 0943... or 12345678">
        </div>

        <div class="col-md-2">
            <label class="form-label">@lang('Sort')</label>
            <select name="sort" class="form-select">
                <option value="latest" {{ request('sort')=='latest'?'selected':'' }}>@lang('Latest')</option>
                <option value="method_asc" {{ request('sort')=='method_asc'?'selected':'' }}>@lang('Method A→Z')</option>
                <option value="method_desc" {{ request('sort')=='method_desc'?'selected':'' }}>@lang('Method Z→A')</option>
                <option value="amount_desc" {{ request('sort')=='amount_desc'?'selected':'' }}>@lang('Credits High→Low')</option>
                <option value="amount_asc" {{ request('sort')=='amount_asc'?'selected':'' }}>@lang('Credits Low→High')</option>
            </select>
        </div>

        <div class="col-md-3 d-flex gap-2">
            <button class="btn btn--base" type="submit">@lang('Filter')</button>
            <a href="{{ route('admin.withdraw.index') }}" class="btn btn--secondary">@lang('Reset')</a>
        </div>
    </form>
</div>
<div class="row gy-4">
    <div class="col-md-12">
        <div class="card b-radius--10">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('User')</th>
                                <th>@lang('Phone / Binance ID')</th>
                                <th>@lang('Method')</th>
                                <th>@lang('Credits')</th>        {{-- أضفنا عنوان الكريدت --}}
                                <th>@lang('Rate / Converted')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>

                        <tbody>
                            @forelse($withdraws as $withdraw)
                                @php
                                    // تحضير الحالة
                                    $rawStatus = (string) ($withdraw->status ?? '');
                                    $statusInt = is_numeric($rawStatus) ? (int)$rawStatus : ([
                                        'pending'=>0,'Pending'=>0,'PENDING'=>0,
                                        'approved'=>1,'Approved'=>1,'APPROVED'=>1,
                                        'rejected'=>2,'Rejected'=>2,'REJECTED'=>2,
                                        'cancelled'=>2,'Cancelled'=>2,'CANCELLED'=>2,
                                        'canceled'=>2,'Canceled'=>2,'CANCELED'=>2,
                                    ][$rawStatus] ?? 0);

                                    // تعيين الميثود بشكل آمن
                                    $method = strtolower(trim($withdraw->method ?? '')) ?: null;
                                    if (!$method) {
                                        $method = $withdraw->binance_id ? 'usdt' : ($withdraw->phone ? 'phone' : null);
                                    }

                                    // اختيار عملة العرض
                                    $general = $general ?? gs();
                                    $curText = $general->cur_text ?? 'USD';

                                    // حساب/اختيار سعر الصرف
                                    $rate = $withdraw->rate;
                                    if ($rate === null) {
                                        if ($method === 'phone') {
                                            $rate = gs()->withdraw_rate_phone ?? gs()->withdraw_rate ?? null;
                                        } elseif ($method === 'usdt') {
                                            $rate = gs()->withdraw_rate_usdt ?? gs()->withdraw_rate ?? null;
                                        } else {
                                            $rate = gs()->withdraw_rate ?? null;
                                        }
                                    }

                                    // المبلغ المحوَّل
                                    $converted = ($rate !== null)
                                        ? (float) $withdraw->credits * (float) $rate
                                        : null;
                                @endphp

                                <tr>
                                    <td>{{ optional($withdraw->user)->fullname ?? '—' }}</td>
                                    <td>
										@php
											$phone = trim((string)($withdraw->phone ?? ''));
											$bid   = trim((string)($withdraw->binance_id ?? ''));
										@endphp

										@if($phone)
											<div><span class="text-muted"></span> {{ $phone }}</div>
										@endif

										@if($bid)
											<div><span class="text-muted"></span> {{ $bid }}</div>
										@endif

										@if(!$phone && !$bid)
											—
										@endif
									</td>
                                    <td>{{ $method ?: '—' }}</td>

                                    {{-- Credits --}}
                                    <td>{{ showAmount($withdraw->credits) }}</td>

                                    {{-- Rate / Converted --}}
                                    <td>
                                        @if($rate !== null)
                                            {{ showAmount($rate) }} /
                                            {{ showAmount($converted) }} {{ __($curText) }}
                                        @else
                                            —
                                        @endif
                                    </td>

                                    {{-- Status --}}
                                    {{-- Status --}}
									<td>
										@if($statusInt === 1)
											<span class="badge badge--success">@lang('Approved')</span>
										@elseif($statusInt === 2)
											@if($withdraw->cancelled_by === 'user')
												<span class="badge badge--warning">@lang('Cancelled by User')</span>
											@else
												<span class="badge badge--danger">@lang('Cancelled by Admin')</span>
											@endif
										@else
											<span class="badge badge--warning">@lang('Pending')</span>
										@endif
									</td>


                                    {{-- Action --}}
                                    <td>
                                        @if($statusInt === 0)
                                            <form action="{{ route('admin.withdraw.approve', $withdraw->id) }}"
                                                  method="POST" class="d-inline"
                                                  onsubmit="return confirm('@lang('Are you sure to approve this withdrawal?')')">
                                                @csrf
                                                <button class="btn btn-sm btn--success" type="submit">@lang('Approve')</button>
                                            </form>

                                            <form action="{{ route('admin.withdraw.reject', $withdraw->id) }}"
                                                  method="POST" class="d-inline"
                                                  onsubmit="return confirm('@lang('Are you sure to reject this withdrawal?')')">
                                                @csrf
                                                <button class="btn btn-sm btn--danger" type="submit">@lang('Reject')</button>
                                            </form>
                                        @else
                                            <span class="text-muted">—</span>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="7">
                                        {{ __($emptyMessage ?? 'No data found') }}
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            @if(method_exists($withdraws,'hasPages') && $withdraws->hasPages())
                <div class="card-footer py-4">
                    @php echo paginateLinks($withdraws) @endphp
                </div>
            @endif
        </div>
    </div>
</div>
@endsection
