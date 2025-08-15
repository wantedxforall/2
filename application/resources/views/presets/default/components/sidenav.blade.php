<div class="sidebar">
    <div class="sidebar__inner">
        <div class="sidebar-top-inner">
            <div class="sidebar__logo">
                <a href="{{route('home')}}" class="sidebar__main-logo">
                    <img src="{{ getImage(getFilePath('logoIcon') . '/logo.png', '?' . time()) }}"
                    alt="{{ config('app.name') }}">
                </a>
                <div class="navbar__left">
                    <button class="navbar__expand">
                        <i class="fa-solid fa-bars-staggered"></i>
                    </button>
                    <button class="sidebar-mobile-menu">
                        <i class="fa-solid fa-bars-staggered"></i>
                    </button>
                </div>
            </div>
            <div class="sidebar__menu-wrapper">
                <ul class="sidebar__menu p-0">
                    <li class="sidebar-menu-item {{ Route::is('user.home') ? 'active' : '' }}">
                        <a href="{{route('user.home')}}">
                            <i class="menu-icon las la-tachometer-alt"></i>
                            <span class="menu-title">@lang('Dashboard')</span>
                        </a>
                    </li>


                    <li class="sidebar-menu-item {{ Route::is('user.plan') ? 'active' : '' }}">
                        <a href="{{route('user.plan')}}">
                            <i class="menu-icon fa-regular fa-credit-card"></i>
                            <span class="menu-title">@lang('Buy Credits')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item {{ Route::is('user.fetch.post') ? 'active' : '' }}">
                        <a href="{{route('user.fetch.post')}}">
                            <i class="menu-icon fa-regular fa-credit-card"></i>
                            <span class="menu-title">@lang('Earn Credits')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-ad"></i>
                            <span class="menu-title">@lang('Campaigns')</span>
                        </a>
                        <ul class="sidebar-submenu ">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu">
                                <a href="{{route('user.service.index')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('All Post')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item sidebar-menu-sub-menu">
                                <a href="{{route('user.service.create')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Create')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item sidebar-menu-sub-menu">
                                <a href="{{route('user.service.active')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Active')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item sidebar-menu-sub-menu">
                                <a href="{{route('user.service.pending')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Pending')</span>
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-dollar-sign"></i>
                            <span class="menu-title">@lang('Deposit')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('user.deposit') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.deposit') ? 'active' : '' }}">
                                <a href="{{route('user.deposit')}}" class="nav-link">
                                    <i class="menu-icon las la-plus"></i>
                                    <span class="menu-title">@lang('Deposit Now')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('user.deposit.history') ? 'active' : '' }}">
                                <a href="{{route('user.deposit.history')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Deposit Log')</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown {{ Route::is('user.withdraw.*') ? 'active' : '' }}">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-money-check-alt"></i>
                            <span class="menu-title">@lang('Withdraw')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('user.withdraw') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item {{ Route::is('user.withdraw.phone') ? 'active' : '' }}">
                                <a href="{{ route('user.withdraw.phone') }}" class="nav-link">
                                    <i class="menu-icon las la-phone"></i>
                                    <span class="menu-title">@lang('Phone')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{ Route::is('user.withdraw.usdt') ? 'active' : '' }}">
                                <a href="{{ route('user.withdraw.usdt') }}" class="nav-link">
                                    <i class="menu-icon las la-wallet"></i>
                                    <span class="menu-title">@lang('USDT')</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-percent"></i>
                            <span class="menu-title">@lang('Affiliation')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('user.reffered') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item {{ Route::is('user.reffered') ? 'active' : '' }}">
                                <a href="{{route('user.reffered')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Referred')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{ Route::is('user.reffered.commission') ? 'active' : '' }}">
                                <a href="{{route('user.reffered.commission')}}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('Commission Logs')</span>
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="sidebar-menu-item {{ Route::is('user.transactions') ? 'active' : '' }}">
                        <a href="{{route('user.transactions')}}">
                            <i class="menu-icon fa-solid fa-filter-circle-dollar"></i>
                            <span class="menu-title">@lang('Transactions')</span>
                        </a>
                    </li>

                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las fas fa-headset"></i>
                            <span class="menu-title">@lang('Support Tickets')</span>
                        </a>
                        <ul class="sidebar-submenu {{ isActiveRoute('ticket') ? 'd-block' : '' }}">
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('ticket') ? 'active' : '' }}">
                                <a href="{{ route('ticket') }}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('My Tickets')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item sidebar-menu-sub-menu {{ Route::is('ticket.open') ? 'active' : '' }}">
                                <a href="{{ route('ticket.open') }}" class="nav-link">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">@lang('New Ticket')</span>
                                </a>
                            </li>
                        </ul>
                    </li>


                </ul>
            </div>
        </div>
        <div class="sidebar-support-box d-grid align-items-center bg-img"
        data-background="{{ asset($activeTemplateTrue . 'images/sidebar-bg.png') }}">
        <div class="sidebar-support-icon">
            <i class="fas fa-question-circle"></i>
        </div>
        <div class="sidebar-support-content">
            <h4 class="title">@lang('Need Help')?</h4>
            <p>@lang('Please contact our support').</p>
            <div class="sidebar-support-btn">
                <a href="{{route('ticket.open')}}" class="btn btn--base w-100 mt-2">@lang('Get Support')</a>
            </div>
        </div>
    </div>
    </div>
</div>
