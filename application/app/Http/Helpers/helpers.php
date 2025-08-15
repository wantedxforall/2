<?php

use Carbon\Carbon;
use App\Lib\Captcha;
use App\Models\User;
use App\Notify\Notify;
use App\Lib\ClientInfo;
use App\Lib\CurlRequest;
use App\Lib\FileManager;
use App\Models\Frontend;
use App\Models\Refferal;
use App\Models\Extension;
use App\Models\Transaction;
use Illuminate\Support\Str;
use App\Models\CommissionLog;
use App\Models\GeneralSetting;
use App\Lib\GoogleAuthenticator;
use Illuminate\Support\Facades\Cache;


function slug($string)
{
    return Illuminate\Support\Str::slug($string);
}

function verificationCode($length)
{
    if ($length == 0)
        return 0;
    $min = pow(10, $length - 1);
    $max = (int) ($min - 1) . '9';
    return random_int($min, $max);
}

function getNumber($length = 8)
{
    $characters = '1234567890';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
         $randomString .= $characters[random_int(0, $charactersLength - 1)];
    }
    return $randomString;
}

function sysInfo()
{
    $system['name'] = 'FExchange';
    $system['version'] = '1.0.0';
    $system['build_version'] = '1.3.3';
    $system['admin_version'] = '10.2.0';
    return $system;
}

function activeTemplate($asset = false)
{
    $general = gs();
    $template = $general->active_template;
    if ($asset)
    return 'assets/presets/' . $template . '/';
    return 'presets.' . $template . '.';
}

function activeTemplateName()
{
    $general = gs();
    $template = $general->active_template;
    return $template;
}

function loadReCaptcha()
{
    return Captcha::reCaptcha();
}

function loadCustomCaptcha($width = '100%', $height = 46, $bgColor = '#003')
{
    return Captcha::customCaptcha($width, $height, $bgColor);
}

function verifyCaptcha()
{
    return Captcha::verify();
}

function loadExtension($key)
{
    $analytics = Extension::where('act', $key)->where('status', 1)->first();
    return $analytics ? $analytics->generateScript() : '';
}

function getTrx($length = 12)
{
    $characters = 'ABCDEFGHJKMNOPQRSTUVWXYZ123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[random_int(0, $charactersLength - 1)];
    }
    return $randomString;
}

function getAmount($amount, $length = 2)
{
    $amount = round($amount, $length);
    return $amount + 0;
}

function showAmount($amount, $decimal = 2, $separate = true, $exceptZeros = false)
{
    $separator = '';
    if ($separate) {
        $separator = ',';
    }
    $printAmount = number_format($amount, $decimal, '.', $separator);
    if ($exceptZeros) {
        $exp = explode('.', $printAmount);
        if ($exp[1] * 1 == 0) {
            $printAmount = $exp[0];
        }
    }
    return $printAmount;
}


function removeElement($array, $value)
{
    return array_diff($array, (is_array($value) ? $value : array($value)));
}

function cryptoQR($wallet)
{
    return "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=$wallet&choe=UTF-8";
}


function keyToTitle($text)
{
    return ucfirst(preg_replace("/[^A-Za-z0-9 ]/", ' ', $text));
}


function titleToKey($text)
{
    return strtolower(str_replace(' ', '_', $text));
}


function strLimit($title = null, $length = 10)
{
    return Str::limit($title, $length);
}


function getIpInfo()
{
    $ipInfo = ClientInfo::ipInfo();
    return $ipInfo;
}


function osBrowser()
{
    $osBrowser = ClientInfo::osBrowser();
    return $osBrowser;
}


// External template fetching disabled; no data is sent out.
function getTemplates()
{
    // Return an empty JSON array so callers receive an empty list.
    return json_encode([]);
}


function getPageSections($arr = false)
{
    $jsonUrl = resource_path('views/') . str_replace('.', '/', activeTemplate()) . 'sections/builder/builder.json';
    $sections = json_decode(file_get_contents($jsonUrl));
    if ($arr) {
        $sections = json_decode(file_get_contents($jsonUrl), true);
        ksort($sections);
    }
    return $sections;
}

function getImage($image, $size = null)
{
    if (file_exists($image) && is_file($image)) {
        $version = '?v=' . filemtime($image); // وقت تعديل الملف
        return asset($image) . $version;
    }

    if ($size) {
        return route('placeholder.image', $size);
    }

    return asset('assets/images/general/default.png');
}


function notify($user, $templateName, $shortCodes = null, $sendVia = null, $createLog = true)
{
    $general = GeneralSetting::first();
    $globalShortCodes = [
        'site_name' => $general->site_name,
        'site_currency' => $general->cur_text,
        'currency_symbol' => $general->cur_sym,
    ];

    if (gettype($user) == 'array') {
        $user = (object) $user;
    }

    $shortCodes = array_merge($shortCodes ?? [], $globalShortCodes);

    $notify = new Notify($sendVia);
    $notify->templateName = $templateName;
    $notify->shortCodes = $shortCodes;
    $notify->user = $user;
    $notify->createLog = $createLog;
    $notify->userColumn = getColumnName($user);
    $notify->send();
}

function getColumnName($user)
{
    $array = explode("\\", get_class($user));
    return strtolower(end($array)) . '_id';
}

function getPaginate($paginate = 20)
{
    return $paginate;
}

function paginateLinks($data)
{
    return $data->appends(request()->all())->links();
}


function menuActive($routeName, $type = null, $param = null)
{
    if ($type == 3)
        $class = 'side-menu--open';
    elseif ($type == 2)
        $class = 'sidebar-submenu__open';
    else
        $class = 'active';

    if (is_array($routeName)) {
        foreach ($routeName as $key => $value) {
            if (request()->routeIs($value))
                return $class;
        }
    } elseif (request()->routeIs($routeName)) {
        if ($param) {
            if (request()->route(@$param[0]) == @$param[1])
                return $class;
            else
                return;
        }
        return $class;
    }
}


function fileUploader($file, $location, $size = null, $old = null, $thumb = null)
{
    $fileManager = new FileManager($file);
    $fileManager->path = $location;
    $fileManager->size = $size;
    $fileManager->old = $old;
    $fileManager->thumb = $thumb;
    $fileManager->upload();
    return $fileManager->filename;
}

function fileManager($allowedPaths = [])
{
    return new FileManager(null, $allowedPaths);
}

function getFilePath($key)
{
    return fileManager()->$key()->path;
}

function getFileSize($key)
{
    return fileManager()->$key()->size;
}

function getFileExt($key)
{
    return fileManager()->$key()->extensions;
}

function diffForHumans($date)
{
    $lang = session()->get('lang');
    Carbon::setlocale($lang);
    return Carbon::parse($date)->diffForHumans();
}


function showDateTime($date, $format = 'M Y, h:i A')
{
    $lang = session()->get('lang');
    Carbon::setlocale($lang);
    return Carbon::parse($date)->translatedFormat($format);
}


function getContent($dataKeys, $singleQuery = false, $limit = null, $orderById = false)
{
    if ($singleQuery) {
        $content = Frontend::where('data_keys', $dataKeys)->orderBy('id', 'desc')->first();
    } else {
        $article = Frontend::query();
        $article->when($limit != null, function ($q) use ($limit) {
            return $q->limit($limit);
        });
        if ($orderById) {
            $content = $article->where('data_keys', $dataKeys)->orderBy('id')->get();
        } else {
            $content = $article->where('data_keys', $dataKeys)->orderBy('id', 'desc')->get();
        }
    }
    return $content;
}


function gatewayRedirectUrl($type = false)
{
    // بعد نجاح الدفع حوّل المستخدم للداشبورد
    if ($type) {
        return 'user.home';
    }
    // في الحالات الأخرى (أخطاء/إعادة المحاولة) ابقِ التحويل على صفحة الإيداع
    return 'user.deposit';
}


function verifyG2fa($user, $code, $secret = null)
{
    $authenticator = new GoogleAuthenticator();
    if (!$secret) {
        $secret = $user->tsc;
    }
    $oneCode = $authenticator->getCode($secret);
    $userCode = $code;
    if ($oneCode == $userCode) {
        $user->tv = 1;
        $user->save();
        return true;
    } else {
        return false;
    }
}


function urlPath($routeName, $routeParam = null)
{
    if ($routeParam == null) {
        $url = route($routeName);
    } else {
        $url = route($routeName, $routeParam);
    }
    $basePath = route('home');
    $path = str_replace($basePath, '', $url);
    return $path;
}


function showMobileNumber($number)
{
    $length = strlen($number);
    return substr_replace($number, '***', 2, $length - 4);
}

function showEmailAddress($email)
{
    $endPosition = strpos($email, '@') - 1;
    return substr_replace($email, '***', 1, $endPosition);
}


function getRealIP()
{
    $ip = $_SERVER["REMOTE_ADDR"];
    //Deep detect ip
    if (filter_var(@$_SERVER['HTTP_FORWARDED'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED'];
    }
    if (filter_var(@$_SERVER['HTTP_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_X_REAL_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_REAL_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_CF_CONNECTING_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CF_CONNECTING_IP'];
    }
    if ($ip == '::1') {
        $ip = '127.0.0.1';
    }

    return $ip;
}


function appendQuery($key, $value)
{
    return request()->fullUrlWithQuery([$key => $value]);
}

function dateSort($a, $b)
{
    return strtotime($a) - strtotime($b);
}

function dateSorting($arr)
{
    usort($arr, "dateSort");
    return $arr;
}

function gs()
{
    if (env('APP_ENV') === 'testing' || app()->runningUnitTests() || defined('PHPUNIT_COMPOSER_INSTALL')) {
        static $general;
        if (!$general) {
            $general = new GeneralSetting();
            $general->site_name = config('app.name');
            $general->active_template = 'default';
        }
        return $general;
    }

    $general = Cache::get('GeneralSetting');
    if (!$general) {
        $general = GeneralSetting::first();
        Cache::put('GeneralSetting', $general);
    }
    return $general;
}

function showRatings($rating)
{
    $ratings = '';
    if ($rating > 0) {
        $avgRating = $rating;
        $integerVal = floor($avgRating);
        $fraction = $avgRating - $integerVal;

        if ($fraction < .25) {
            $avgRating = intval($avgRating);
        }
        if ($fraction > .75) {
            $avgRating = intval($avgRating) + 1;
        }
        for ($i = 1; $i <= $avgRating; $i++) {
            $ratings .= '<i class="fas fa-star"></i>';
        }
        if ($fraction > .25 && $fraction < .75) {
            $avgRating += 1;
            $ratings .= '<i class="fas fa-star-half-alt"></i>';
        }
    } else {
        $avgRating = 0;
    }
    $nonStar = 5 - intval($avgRating);
    for ($k = 1; $k <= $nonStar; $k++) {
        $ratings .= '<i class="far fa-star"></i>';
    }
    return $ratings;
}


function levelCommision($id, $amountSendByUser, $trx, $commissionType = '')
{
    $usr = $id;
    $i = 1;
    $amount = $amountSendByUser;

    $level = Refferal::count();
    $gnl = GeneralSetting::first();

    while ($usr != "" || $usr != "0" || $i < $level) {
        $me = User::find($usr);
        $refer = User::find($me->ref_by);
        if ($refer == "") {
            break;
        }
        $comission = Refferal::where('level', $i)->first();
        if ($comission == null) {
            break;
        }

        $com = ($amount * $comission->percent) / 100;

        $referWallet = User::where('id', $refer->id)->first();
        $new_bal = getAmount($referWallet->balance + $com);
        $referWallet->balance = $new_bal;
        $referWallet->save();


        $transaction = new Transaction();
        $transaction->user_id  = $refer->id;
        $transaction->amount  = getAmount($com);
        $transaction->charge  = 0;
        $transaction->trx_type  = '+';
        $transaction->remark  = 'commission';
        $transaction->details  = $i . 'level Referral Commission';
        $transaction->trx = $trx;
        $transaction->post_balance =$new_bal;
        $transaction->save();


        $commission = new CommissionLog();
        $commission->user_id = $refer->id;
        $commission->who = $id;
        $commission->level = $i . ' level Referral Commission';
        $commission->amount = getAmount($com);
        $commission->main_amo = $new_bal;
        $commission->title = $commissionType;
        $commission->trx = $trx;
        $commission->save();

        notify($refer, 'REFERRAL_COMMISSION', [
            'amount' =>  getAmount($com),
            'post_balance' => $new_bal,
            'trx' => $trx,
            'level' => $i . ' level Referral Commission',
        ]);

        $usr = $refer->id;
        $i++;
    }
    return 0;
}



function isActiveRoute($routes) {
    return Str::startsWith(Route::currentRouteName(), $routes);
}

