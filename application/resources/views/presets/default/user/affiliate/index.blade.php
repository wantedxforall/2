@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="m-0">
            <div class="list-card">
                <div class="row search-dash justify-content-end mb-3">
                    <div class="col-lg-4 col-md-8 col-12">
                        <input type="text" name="search_table" class="form--control" placeholder="Search...">
                        <i class="las la-search"></i>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <table class="custom-table">
                            <thead>
                                <tr>
                                    <th>@lang('Reffer User')</th>
                                    <th>@lang('Level')</th>
                                    <th>@lang('Amount')</th>
                                    <th>@lang('Main Amount')</th>
                                    <th>@lang('Description')</th>
                                    <th>@lang('Time')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($commissions as $data)
                                    <tr>
                                        <td data-label="@lang('Reffer User')">{{__(@$data->reffer->username) }}</td>
                                        <td data-label="@lang('Level')"><span
                                                class="badge badge--success">{{ __($data->level) }}</span></td>
                                        <td data-label="@lang('Amount')">{{ showAmount($data->amount) }} {{ $general->cur_text }}</td>
                                        <td data-label="@lang('Main Amount')" class="amount">{{ showAmount($data->main_amo) }}
                                            {{ $general->cur_text }}</td>
                                        <td data-label="@lang('Description')" class="amount">
                                            <div class="min--width">
                                                {{ __($data->title) }}
                                            </div>
                                        </td>
                                        <td data-label="@lang('Time')" class="nowrap">
                                            {{ showDateTime($data->created_at) }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td data-label="@lang('Commission Table')" colspan="100%" class="text-center">
                                            {{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-5">
                        @if($commissions->hasPages())
                            <div class="py-4">
                                {{ paginateLinks($commissions) }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    (function ($) {
            "use strict";

            $('.custom-table').css('padding-top', '0px');
            var tr_elements = $('.custom-table tbody tr');

            $(document).on('input', 'input[name=search_table]', function () {
                "use strict";

                var search = $(this).val().toUpperCase();
                var match = tr_elements.filter(function (idx, elem) {
                    return $(elem).text().trim().toUpperCase().indexOf(search) >= 0 ? elem : null;
                }).sort();
                var table_content = $('.custom-table tbody');
                if (match.length == 0) {
                    table_content.html('<tr><td colspan="100%" class="text-center">Data Not Found</td></tr>');
                } else {
                    table_content.html(match);
                }
            });

            $('.deletModalBtn').on('click', function () {
                var modal = $('#deleteModal');
                var id = $(this).data('id');
                modal.find('input[name=id]').val(id);
                modal.modal('show');
            });

    })(jQuery);

</script>
@endpush
