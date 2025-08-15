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
                                    <th>@lang('Name')</th>
                                    <th>@lang('Category')</th>
                                    <th>@lang('Link')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($services as $service)
                                <tr>
                                    <td  data-label="@lang('Name')">{{__($service->name)}}</td>
                                    <td  data-label="@lang('Category')">{{__( @$service->category->name)}} </td>
                                    <td  data-label="@lang('Link')"><a class="btn btn--sm btn--base" href="{{$service->link}}" target="_blank" title="Link"><i class="fa-solid fa-link"></i></a></td>

                                    <td  data-label="@lang('Status')">
                                        @php echo $service->statusBadge($service->status); @endphp
                                    </td>
                                    <td data-label="@lang('Action')">
                                        <form action="{{ route('user.service.change.status') }}" method="post" class="d-inline">
                                            @csrf
                                            <input type="hidden" name="id" value="{{$service->id}}">
                                            <input type="hidden" name="status" value="{{$service->status == 1 ? 0 : 1}}">
                                            <button type="submit" class="btn btn--sm btn--warning" title="@lang('Change Status')"><i class="fas fa-toggle-off"></i></button>
                                        </form>
                                        <a href="{{route('user.service.edit',$service->id)}}" class="btn btn--sm btn--base" title="Edit"><i class="las la-edit"></i></a>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td data-label="@lang('Service Table')" class="text-muted text-center" colspan="100%">{{__($emptyMessage) }}</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-5">
                        @if ($services->hasPages())
                        <div class="card-footer py-4">
                            {{ paginateLinks($services) }}
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
            

    })(jQuery);

</script>
@endpush



