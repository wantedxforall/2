
@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="body-area text-center">
        <h5>@lang('Libyana Transfer')</h5>

        <img src="https://seeklogo.com/images/L/libyana-logo-A209AE50E7-seeklogo.com.png" alt="Libyana Logo" class="logo">
        <h4><a href="https://www.youtube.com/watch?v=HYJf2_Hr8lQ">@lang('Instructions')</a></h4>
        <h4><strong>@lang('Please wait 5 minutes in case confirmation fails and try again.')</strong></h4>
        <h4>@lang('If you face any issue') <a href="https://abdocenter.com/tickets">@lang('open a ticket')</a></h4>

        <div class="form-group">
          <label>@lang('Today\'s USD rate:')</label>
          <div id="rate" class="btn">@lang('Loading...')</div>
        </div>

        <div class="form-group" id="numberInputsContainer">
          <label>@lang('Transfer number (Libyana):')</label>
          <p id="loadingNumbers">@lang('Fetching numbers...')</p>
        </div>

        <div class="form-group">
          <label for="phone">@lang('Phone number:')</label>
          <input type="text" id="phone" class="form-control" placeholder="920000000">
        </div>

        <div class="form-group">
          <label for="amount">@lang('Amount:')</label>
          <input type="number" id="amount" class="form-control">
        </div>

        <button id="payButton" class="btn" onclick="libyana.confirmTransfer()">@lang('Confirm Transfer')</button>
        <div id="message"></div>

      </div>
    </div>
  </div>
</div>
@endsection

@push('style')
<style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f5f5;
      color: #333;
    }
    .logo { width: 267px; max-width: 100%; margin-bottom: 20px; }
    .form-group { margin-bottom: 20px; }
    .form-control { width: 100%; padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 5px; }
    .btn { padding: 10px 20px; font-size: 16px; background-color: #28a745; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
    .btn:disabled { background-color: #ccc; cursor: not-allowed; }
    .input-group { display: flex; justify-content: center; align-items: center; margin-bottom: 10px; gap: 10px; }
    .badge-success { background-color: #28a745; color: #fff; padding: 10px; border-radius: 5px; font-size: 16px; }
    .btn-copy { background-color: #218838; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer; }
    .copy-message { font-size: 14px; color: #28a745; margin-top: 5px; display: none; }
    .alert { padding: 10px; margin-top: 20px; border-radius: 5px; }
    .alert-success { background-color: #d4edda; color: #155724; }
    .alert-error { background-color: #f8d7da; color: #721c24; }
    a { color: #ff00ff; text-decoration: underline; }
</style>
@endpush

@push('script')
<meta name="csrf-token" content="{{ csrf_token() }}">
<script>
    window.libyanaConfig = {
        apiUrl: @json(config('services.libyana.api_url')),
        infoUrl: @json(config('services.libyana.info_url')),
        storeId: @json((int) config('services.libyana.store_id'))
    };
</script>
<script src="{{ asset('assets/common/js/libyana.js') }}"></script>
@endpush
