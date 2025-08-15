@extends($activeTemplate.'layouts.master')
@section('content')
<div class="body-wrapper">
    <div class="table-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="dashboard-card-wrap mt-0">
                    <form class="register" action="" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row gy-4">
                            <div class="col-sm-12">
                                <div class="drop-file-wrap--">
                                    <div class="dashboard_profile_wrap">
                                        <div class="profile_photo mb-2">
                                            <img src="{{ getImage(getFilePath('userProfile').'/'.$user->image,getFileSize('userProfile')) }}"  alt="@lang('user profile')">
                                            <div class="photo_upload">
                                                <label for="image"><i class="fas fa-image"></i></label>
                                                <input id="image" type="file" name="image" class="upload_file">
                                            </div>
                                        </div>
                                        <div class="user-info text-center">
                                            <p><span>@lang('Name'):</span> {{__($user->fullname)}}</p>
                                            <p><span>@lang('Email'):</span> {{$user->email}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="first_name" class="form--label">@lang('First Name')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="first_name" name="firstname"
                                            value="{{$user->firstname}}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="last_name" class="form--label">@lang('Last Name')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="last_name" name="lastname"
                                            value="{{$user->lastname}}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email_address" class="form--label">@lang('E-mail Address')</label>
                                    <div class="input--group">
                                        <input type="text" class="form--control" id="email_address" value="{{$user->email}}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="zip_code" class="form--label">@lang('Mobile Number')</label>
                                    <div class="input--group">
                                        <input type="text" id="zip_code" class="form--control" name="address"
                                            value="{{@$user->address->address}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone_number" class="form--label">@lang('State')</label>
                                    <div class="input--group">
                                        <input type="text" id="phone_number" class="form--control" name="state"
                                            value="{{@$user->address->state}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone_number" class="form--label">@lang('Zip Code')</label>
                                    <div class="input--group">
                                        <input type="text" id="phone_number" class="form--control" name="zip"
                                            value="{{@$user->address->zip}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone_number" class="form--label">@lang('City')</label>
                                    <div class="input--group">
                                        <input type="text" id="phone_number" class="form--control" name="city"
                                            value="{{@$user->address->city}}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="phone_number" class="form--label">@lang('Country')</label>
                                    <div class="input--group">
                                        <input type="text" id="phone_number" class="form--control"
                                            value="{{@$user->address->country}}" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-end">
                                <button type="submit" class="btn btn--base ms-2">
                                    @lang('Submit')
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
