@extends('admin.layouts.app')
@section('panel')
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-8 col-xl-8">
            <div class="card">
                <div class="card-header bg--primary">
                    <h3 class="title text-white">@lang('Refferal Setting')</h3>
                </div>
                <div class="card-body">
                    <form action="{{route('admin.refferal.store')}}" id="form_generate" method="post">
                        @csrf
                        <div class="form-group">
                            <label> @lang('Commission %:')</label>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="description">
                                        <div class="row">
                                            <div class="col-md-12" id="planDescriptionContainer"><div class="form-group" style="margin-top: 5px">
                                                <input name="level" class="form-control margin-top-10 mb-2" type="hidden" readonly required placeholder="Level-01">
                                                <input name="percent" class="form-control margin-top-10" type="text" value="{{@$refferal->percent}}" required placeholder="Commission Percentage %">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn--primary btn-block">@lang('Submit')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        (function() {
            'use strict';

            var max = 1;
            $("#generate").on('click', function() {

                var da = $('#levelGenerate').val();
                var a = 0;
                var val = 1;
                var htmlData = '';
                if (da !== '' && da > 0) {
                    if (da > 200) {
                        return false;
                    }
                    $('#form_generate').css('display', 'block');

                    for (a; a < parseInt(da); a++) {


                        htmlData += '<div class="input-group" style="margin-top: 5px">\n' +
                            '<input name="level[]" class="form-control margin-top-10 mb-2" type="number" readonly value="' +
                            val++ + '" required placeholder="Level">\n' +
                            '<input name="percent[]" class="form-control margin-top-10" type="text" required placeholder="Commission Percentage %">\n' +
                            '<span class="input-group-btn">\n' +
                            '<button class="btn btn-danger margin-top-10 ml-4 h-100 delete_desc" type="button"><i class=\'fa fa-times\'></i></button></span>\n' +
                            '</div>'
                    }
                    $('#planDescriptionContainer').html(htmlData);

                } else {

                    alert('Level Field Is Required')
                }

            });

            $(document).on('click', '.delete_desc', function() {
                'use strict'
                $(this).closest('.input-group').remove();
            });

        })();
    </script>
@endpush
