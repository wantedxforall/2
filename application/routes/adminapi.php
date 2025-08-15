<?php

use Illuminate\Support\Facades\Route;

Route::namespace('Api')->name('adminapi.')->group(function(){
    Route::post('add-payment', 'AdminApiController@addPayment')->name('add_payment');
});