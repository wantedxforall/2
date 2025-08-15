<?php

use App\Lib\Router;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Api\AdminApiController;
use App\Http\Controllers\User\WithdrawController;
use App\Http\Controllers\Admin\WithdrawController as AdminWithdrawController;
use App\Http\Controllers\User\DashboardController;
use App\Http\Controllers\PaymentWebhookController;

Route::prefix('admin')
    ->name('admin.')
    ->middleware([
        'auth',
        \App\Http\Middleware\AdminCheck::class,
        \App\Http\Middleware\RedirectIfNotAdmin::class,
    ])
    ->group(function () {

        // قائمة طلبات السحب
        Route::get('/withdraw', [AdminWithdrawController::class, 'index'])
            ->name('withdraw.index');

        // الموافقة (يتوافق مع زر POST في الـ Blade)
        Route::post('/withdraw/{id}/approve', [AdminWithdrawController::class, 'approve'])
            ->name('withdraw.approve');

        // الرفض (يتوافق مع زر POST في الـ Blade)
        Route::post('/withdraw/{id}/reject',  [AdminWithdrawController::class, 'reject'])
            ->name('withdraw.reject');

        // (اختياري) لو تحب روابط GET بدل POST، فعّل هذين واستعمل روابط GET في القالب:
        // Route::get('/withdraw/{id}/approve', [AdminWithdrawController::class, 'approve'])->name('withdraw.approve');
        // Route::get('/withdraw/{id}/reject',  [AdminWithdrawController::class, 'reject')->name('withdraw.reject');
    });
    
// User Support Ticket
Route::controller('TicketController')->prefix('ticket')->group(function () {
    Route::get('/', 'supportTicket')->name('ticket');
    Route::get('/new', 'openSupportTicket')->name('ticket.open');
    Route::post('/create', 'storeSupportTicket')->name('ticket.store');
    Route::get('/view/{ticket}', 'viewTicket')->name('ticket.view');
    Route::post('/reply/{ticket}', 'replyTicket')->name('ticket.reply');
    Route::post('/close/{ticket}', 'closeTicket')->name('ticket.close');
    Route::get('/download/{ticket}', 'ticketDownload')->name('ticket.download');
});

Route::controller('Admin\AdController')->group(function () {
    Route::get('/ads/{ad}/{type}/{adType}', 'getAdvertise')->name('adsUrl');
    Route::get('/ad-clicked/{adid}', 'adClicked')->name('adClicked');
});

Route::get('app/deposit/confirm/{hash}', 'Gateway\PaymentController@appDepositConfirm')->name('deposit.app.confirm');
Route::post('/payment/confirm', [PaymentController::class, 'confirmTransfer'])->name('payment.confirm');
Route::match(['get', 'post'], '/payment/webhook/confirm', [PaymentWebhookController::class, 'confirm'])
    ->middleware('auth')
    ->name('payment.webhook.confirm');
Route::get('/adminapi/v1', [AdminApiController::class, 'handleRequest']);

Route::middleware('auth')
    ->prefix('user')
    ->name('user.')
    ->group(function () {
        // قائمة السحوبات للمستخدم
        Route::get('withdraw',           [WithdrawController::class, 'index'])->name('withdraw.index');

        // إنشاء طلب جديد (صفحة الخيارين أو حسب تصميمك)
        Route::get('withdraw/create',    [WithdrawController::class, 'create'])->name('withdraw.create');

        // صفحات كل طريقة بشكل مستقل
        Route::get('withdraw/phone',     [WithdrawController::class, 'phoneForm'])->name('withdraw.phone');
        Route::get('withdraw/usdt',      [WithdrawController::class, 'usdtForm'])->name('withdraw.usdt');

        // حفظ الطلب (POST واحد فقط)
        Route::post('withdraw',          [WithdrawController::class, 'store'])->name('withdraw.store');

        // إلغاء الطلب
        Route::post('withdraw/cancel',   [WithdrawController::class, 'cancel'])->name('withdraw.cancel');
		
	});

	Route::middleware('auth')->get('/user/levels', [\App\Http\Controllers\User\LevelViewController::class, 'index'])->name('user.levels');
		

Route::controller('SiteController')->group(function () {
    Route::get('/contact', 'contact')->name('contact');
    Route::post('/contact', 'contactSubmit');
    Route::get('/change/{lang?}', 'changeLanguage')->name('lang');

    Route::get('cookie-policy', 'cookiePolicy')->name('cookie.policy');

    Route::get('/cookie/accept', 'cookieAccept')->name('cookie.accept');

    //blog
    Route::get('/blog','blog')->name('blog');
    Route::get('blog/{slug}/{id}', 'blogDetails')->name('blog.details');

    Route::get('policy/{slug}/{id}', 'policyPages')->name('policy.pages');

    Route::get('placeholder-image/{size}', 'placeholderImage')->name('placeholder.image');

    //subscriber
    Route::match(['get','post'],'/subscribe','subscribe')->name('subscribe');

    //plan
    Route::get('/plan','plan')->name('plan');


    Route::get('/{slug}', 'pages')->name('pages');
    Route::get('/', 'index')->name('home');
});


