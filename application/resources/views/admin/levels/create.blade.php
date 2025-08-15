@extends('admin.layouts.app')

@section('panel')
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <div class="row mb-none-30">
        <div class="col-lg-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.levels.store') }}" method="POST">
                        @csrf

                        <div class="row">
                            {{-- الاسم --}}
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Name')</label>
                                    <input type="text" name="name" value="{{ old('name') }}" class="form-control" required>
                                    @error('name')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- الحد الأدنى لاستهلاك النقاط للوصول للمستوى --}}
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Min Points Spent')</label>
                                    <input type="number" name="min_points_spent" value="{{ old('min_points_spent', 0) }}" min="0" class="form-control" required>
                                    @error('min_points_spent')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- أولوية المستوى (الأعلى يفوز عند التزاحم) --}}
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Priority')</label>
                                    <input type="number" name="priority" value="{{ old('priority', 1) }}" min="1" class="form-control" required>
                                    @error('priority')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- شارة/صورة --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Badge (URL)')</label>
                                    <input type="text" name="badge" value="{{ old('badge') }}" class="form-control" placeholder="https://...">
                                    @error('badge')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- الحالة --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold d-block mb-2">@lang('Status')</label>
                                    <label class="switch m-0">
                                        <input type="checkbox" name="is_active" value="1" {{ old('is_active', 1) ? 'checked' : '' }}>
                                        <span class="slider round"></span>
                                    </label>
                                    @error('is_active')<small class="text-danger d-block">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- جدول المزايا/المكافآت --}}
                            <div class="col-lg-12 mt-3">
                                <label class="font-weight-bold">@lang('Benefits')</label>

                                @php
                                    // إعادة بناء الصفوف من old() عند فشل التحقق
                                    $oldBenefits = old('benefits');
                                    if (!is_array($oldBenefits) || empty($oldBenefits)) {
                                        $oldBenefits = [
                                            ['type' => 'services_discount_percent', 'value' => '', 'is_active' => 1],
                                        ];
                                    }
                                @endphp

                                <div class="table-responsive--sm table-responsive">
                                    <table class="table table--light style--two">
                                        <thead>
                                            <tr>
                                                <th style="width:40%">@lang('Benefit Type')</th>
                                                <th style="width:30%">@lang('Value')</th>
                                                <th style="width:15%">@lang('Status')</th>
                                                <th style="width:15%">@lang('Action')</th>
                                            </tr>
                                        </thead>
                                        <tbody class="benefit-fields">
                                            @foreach($oldBenefits as $i => $b)
                                                <tr>
                                                    <td>
                                                        <select name="benefits[{{ $i }}][type]" class="form-control" required>
                                                            <option value="" disabled {{ empty($b['type']) ? 'selected' : '' }}>@lang('Select type')</option>
                                                            <option value="bonus_points_percent" {{ (isset($b['type']) && $b['type']=='bonus_points_percent') ? 'selected' : '' }}>
                                                                @lang('Bonus points % (on purchase)')
                                                            </option>
                                                            <option value="buy_points_discount_percent" {{ (isset($b['type']) && $b['type']=='buy_points_discount_percent') ? 'selected' : '' }}>
                                                                @lang('Buy points discount %')
                                                            </option>
                                                            <option value="services_discount_percent" {{ (isset($b['type']) && $b['type']=='services_discount_percent') ? 'selected' : '' }}>
                                                                @lang('Services discount %')
                                                            </option>
                                                            <option value="withdraw_fee_discount_percent" {{ (isset($b['type']) && $b['type']=='withdraw_fee_discount_percent') ? 'selected' : '' }}>
                                                                @lang('Withdraw fee discount %')
                                                            </option>
                                                            <option value="withdraw_min_reduction_fixed" {{ (isset($b['type']) && $b['type']=='withdraw_min_reduction_fixed') ? 'selected' : '' }}>
                                                                @lang('Withdraw minimum reduction (fixed)')
                                                            </option>
                                                        </select>
                                                        @error("benefits.$i.type")<small class="text-danger d-block">{{ $message }}</small>@enderror
                                                    </td>
                                                    <td>
                                                        <input type="number" step="0.01" min="0"
                                                               name="benefits[{{ $i }}][value]"
                                                               value="{{ $b['value'] ?? '' }}" class="form-control" required>
                                                        @error("benefits.$i.value")<small class="text-danger d-block">{{ $message }}</small>@enderror
                                                    </td>
                                                    <td>
                                                        <label class="switch m-0">
                                                            <input type="checkbox" name="benefits[{{ $i }}][is_active]" value="1"
                                                                   {{ (isset($b['is_active']) ? (int)$b['is_active'] : 1) ? 'checked' : '' }}>
                                                            <span class="slider round"></span>
                                                        </label>
                                                        @error("benefits.$i.is_active")<small class="text-danger d-block">{{ $message }}</small>@enderror
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn--danger removeBenefit"><i class="la la-times"></i></button>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <div class="text-end">
                                    <button type="button" class="btn btn--primary addBenefit">
                                        <i class="fa fa-plus"></i> @lang('Add Benefit')
                                    </button>
                                </div>

                                <p class="text-muted mt-2 mb-0" style="font-size:12px;">
                                    • @lang('Percent fields are percentages (e.g., 5 = 5%)')<br>
                                    • @lang('Fixed field reduces the withdrawal minimum by a fixed amount')
                                </p>
                            </div>

                            <div class="col-lg-12">
                                <div class="form-group float-end p-3">
                                    <button type="submit" class="btn btn--primary btn-block btn-lg">@lang('Create')</button>
                                </div>
                            </div>
                        </div> {{-- .row --}}
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.levels.index') }}" class="btn btn-sm btn--primary box--shadow1 text--small">
        <i class="las la-angle-double-left"></i> @lang('Go Back')
    </a>
@endpush

@push('script')
<script>
(function($){
    "use strict";

    // ابدأ من عدد الصفوف الحالية (بعد old())
    let i = $('.benefit-fields tr').length;

    $('.addBenefit').on('click', function(){
        const row = `
        <tr>
            <td>
                <select name="benefits[${i}][type]" class="form-control" required>
                    <option value="" disabled selected>@lang('Select type')</option>
                    <option value="bonus_points_percent">@lang('Bonus points % (on purchase)')</option>
                    <option value="buy_points_discount_percent">@lang('Buy points discount %')</option>
                    <option value="services_discount_percent">@lang('Services discount %')</option>
                    <option value="withdraw_fee_discount_percent">@lang('Withdraw fee discount %')</option>
                    <option value="withdraw_min_reduction_fixed">@lang('Withdraw minimum reduction (fixed)')</option>
                </select>
            </td>
            <td>
                <input type="number" step="0.01" min="0" name="benefits[${i}][value]" class="form-control" required>
            </td>
            <td>
                <label class="switch m-0">
                    <input type="checkbox" name="benefits[${i}][is_active]" value="1" checked>
                    <span class="slider round"></span>
                </label>
            </td>
            <td>
                <button type="button" class="btn btn--danger removeBenefit"><i class="la la-times"></i></button>
            </td>
        </tr>`;
        $('.benefit-fields').append(row);
        i++;
    });

    $(document).on('click', '.removeBenefit', function(){
        $(this).closest('tr').remove();
    });
})(jQuery);
</script>
@endpush
