<div class="row mt-4">
    <div class="col-lg-12">
        @php
            $withdraws = $withdraws ?? ($withdrawals ?? collect());
        @endphp
        @if($withdraws->count())
        <table class="custom-table">
            <thead>
                <tr>
                    <th>
                        @if($withdraws->first() && $withdraws->first()->method === 'usdt')
                            @lang('Binance ID')
                        @else
                            @lang('Phone')
                        @endif
                    </th>
                    <th>@lang('Credits')</th>
                    <th>@lang('Status')</th>
                    <th>@lang('Action')</th>
                </tr>
            </thead>
            <tbody>
                @foreach($withdraws as $withdraw)
                @php
                    $raw = (string)($withdraw->status ?? '');
                    $statusInt = is_numeric($raw) ? (int)$raw : ([
                        'pending'=>0,
                        'approved'=>1,
                        'rejected'=>2,
                        'cancelled'=>2,
                        'canceled'=>2
                    ][$raw] ?? 0);
                    $label = match ($statusInt) {
                        1 => __('Approved'),
                        2 => __('Rejected'),
                        default => __('Pending'),
                    };
                @endphp
                <tr>
                    <td data-label="@lang('Binance ID')">
                        @if($withdraw->method === 'usdt')
                            {{ $withdraw->binance_id ?? '—' }}
                        @else
                            {{ $withdraw->phone ?? '—' }}
                        @endif
                    </td>
                    <td data-label="@lang('Credits')">{{ showAmount($withdraw->credits) }}</td>
                    <td data-label="@lang('Status')">{{ $label }}</td>
                    <td data-label="@lang('Action')">
                        @if($statusInt === 0)
                            <form action="{{ route('user.withdraw.cancel') }}" method="POST" 
                                  onsubmit="return confirm('@lang('Are you sure to cancel this request?')')">
                                @csrf
                                <input type="hidden" name="id" value="{{ $withdraw->id }}">
                                <button type="submit" class="btn btn--sm btn--danger">@lang('Cancel')</button>
                            </form>
                        @else
                            <span class="text-muted">-</span>
                        @endif
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        @else
            <p class="text-center text-muted">@lang('No withdraw requests found.')</p>
        @endif
    </div>
</div>
