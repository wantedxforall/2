@extends('admin.layouts.app')

@section('panel')
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $e)
                    <li>{{ $e }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10">
                <div class="card-body">
                    {{-- تحديث بيانات المستوى (POST update/{id}) --}}
                    <form action="{{ route('admin.levels.update', $level->id) }}" method="POST">
                        @csrf

                        <div class="row">
                            {{-- Name --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Name')</label>
                                    <input type="text" name="name" class="form-control"
                                           value="{{ old('name', $level->name) }}" required>
                                    @error('name')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- Min Points Spent --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Min Points Spent')</label>
                                    <input type="number" name="min_points_spent" min="0" class="form-control"
                                           value="{{ old('min_points_spent', $level->min_points_spent) }}" required>
                                    @error('min_points_spent')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- Priority --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Priority')</label>
                                    <input type="number" name="priority" min="1" class="form-control"
                                           value="{{ old('priority', $level->priority) }}" required>
                                    @error('priority')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- Badge (URL) --}}
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="font-weight-bold">@lang('Badge (URL)')</label>
                                    <input type="text" name="badge" class="form-control"
                                           value="{{ old('badge', $level->badge) }}" placeholder="https://...">
                                    @error('badge')<small class="text-danger">{{ $message }}</small>@enderror
                                </div>
                            </div>

                            {{-- Status (is_active) --}}
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="font-weight-bold d-block mb-2">@lang('Status')</label>
                                    <label class="switch m-0">
                                        <input type="checkbox" name="is_active" value="1" checked>
                                        <span class="slider round"></span>
                                    </label>
                                    @error('is_active')<small class="text-danger d-block">{{ $message }}</small>@enderror
                                </div>
                            </div>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn--primary">@lang('Update')</button>
                            <a href="{{ route('admin.levels.index') }}" class="btn btn--dark">@lang('Back')</a>
                        </div>
                    </form>
                </div>
            </div>

            {{-- ====== إدارة المزايا (Benefits) ====== --}}
            <div class="card mt-3">
                <div class="card-header">
                    <h6 class="mb-0">@lang('Benefits')</h6>
                </div>
                <div class="card-body">

                    {{-- إضافة ميزة جديدة --}}
                    <form action="{{ route('admin.levels.benefits.store') }}" method="POST" class="mb-4">
                        @csrf
                        <input type="hidden" name="level_id" value="{{ $level->id }}">
                        <div class="row g-2 align-items-end">
                            <div class="col-md-5">
                                <label class="font-weight-bold">@lang('Benefit Type')</label>
                                <select name="type" class="form-control" required>
                                    <option value="" disabled selected>@lang('Select type')</option>
                                    <option value="bonus_points_percent">@lang('Bonus points % (on purchase)')</option>
                                    <option value="buy_points_discount_percent">@lang('Buy points discount %')</option>
                                    <option value="services_discount_percent">@lang('Services discount %')</option>
                                    <option value="withdraw_fee_discount_percent">@lang('Withdraw fee discount %')</option>
                                    <option value="withdraw_min_reduction_fixed">@lang('Withdraw minimum reduction (fixed)')</option>
                                </select>
                                @error('type')<small class="text-danger d-block">{{ $message }}</small>@enderror
                            </div>
                            <div class="col-md-3">
                                <label class="font-weight-bold">@lang('Value')</label>
                                <input type="number" step="0.01" min="0" name="value" class="form-control" required>
                                @error('value')<small class="text-danger d-block">{{ $message }}</small>@enderror
                            </div>
                            <div class="col-md-2">
                                <label class="font-weight-bold d-block">@lang('Active')</label>
                                <label class="switch m-0">
                                    <input type="hidden" name="is_active" value="0">
                                    <input type="checkbox" name="is_active" value="1" checked>
                                    <span class="slider round"></span>
                                </label>
                                @error('is_active')<small class="text-danger d-block">{{ $message }}</small>@enderror
                            </div>
                            <div class="col-md-2 text-end">
                                <button type="submit" class="btn btn--primary w-100">@lang('Add')</button>
                            </div>
                        </div>
                    </form>

                    {{-- قائمة المزايا الحالية --}}
                    <div class="table-responsive">
                        <table class="table table--light style--two align-middle">
                            <thead>
                                <tr>
                                    <th>@lang('Type')</th>
                                    <th style="width:160px">@lang('Value')</th>
                                    <th style="width:120px">@lang('Active')</th>
                                    <th style="width:220px">@lang('Actions')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($level->benefits as $benefit)
                                    @php $formId = "benefit-form-{$benefit->id}"; @endphp
                                    <tr>
                                        <td class="text-break">
                                            {{ $benefit->type }}

                                            {{-- نموذج التحديث (فارغ بصريًا) --}}
                                            <form id="{{ $formId }}" action="{{ route('admin.levels.benefits.update', $benefit->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                <input type="hidden" name="level_id" value="{{ $level->id }}">
                                                <input type="hidden" name="type" value="{{ $benefit->type }}">
                                            </form>
                                        </td>

                                        {{-- value مرتبط بالنموذج عبر form= --}}
                                        <td>
                                            <input type="number" step="0.01" min="0"
                                                   name="value"
                                                   form="{{ $formId }}"
                                                   class="form-control"
                                                   value="{{ $benefit->value }}" required>
                                        </td>

                                        {{-- is_active مرتبط بالنموذج عبر form= --}}
                                        <td>
                                            <label class="switch m-0">
                                                <input type="hidden" name="is_active" value="0" form="{{ $formId }}">
                                                <input type="checkbox" name="is_active" value="1" form="{{ $formId }}" {{ $benefit->is_active ? 'checked' : '' }}>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>

                                        <td>
                                            <div class="d-flex gap-2">
                                                <button type="submit" class="btn btn-sm btn--primary" form="{{ $formId }}">
                                                    @lang('Save')
                                                </button>

                                                <form action="{{ route('admin.levels.benefits.destroy') }}" method="POST" onsubmit="return confirm('@lang('Delete?')');" class="d-inline">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $benefit->id }}">
                                                    <button type="submit" class="btn btn-sm btn--danger">
                                                        @lang('Delete')
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="text-center text-muted">@lang('No benefits')</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <p class="text-muted mt-2 mb-0" style="font-size:12px;">
                        • @lang('Percent fields are percentages (e.g., 5 = 5%)')<br>
                        • @lang('Fixed field reduces the withdrawal minimum by a fixed amount')
                    </p>
                </div>
            </div>
            {{-- ====== نهاية إدارة المزايا ====== --}}
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.levels.index') }}" class="btn btn-sm btn--dark">
        <i class="las la-angle-double-left"></i> @lang('Back')
    </a>
@endpush
