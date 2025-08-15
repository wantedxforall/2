<?php

namespace App\Http\Controllers\Admin;

use App\Models\Ad;
use App\Models\AdType;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Crypt;
use Intervention\Image\Facades\Image;

class AdController extends Controller
{
    // ad type manage
    public function fetchAdType(){
        $pageTitle = "Ad Types";
        $adTypes = AdType::latest()->paginate(getPaginate());
        return view('admin.ads.adType.index',compact('pageTitle','adTypes'));
    }

    public function AdTypeStore(Request $request){

        $request->validate([
            'name'=> 'required',
            'type' => 'required',
            'width'=>'required|integer|gt:0',
            'height' =>'required|integer|gt:0',
            'slug'=>'required|unique:ad_types',
        ]);

        if(AdType::where('slug',$request->width.'x'.$request->height)->first()){
            $notify[]=['error','Slug has already been taken'];
           return back()->withNotify($notify);
       }

        $adType = new AdType();
        $adType->name = $request->name;
        $adType->type = $request->type;
        $adType->width = $request->width;
        $adType->height = $request->height;
        $adType->slug = $request->width.'x'.$request->height;
        $adType->status = 1;
        $adType->save();

        $notify[]=['success','Ad type has been created successfully'];
        return back()->withNotify($notify);
    }

    public function AdTypeUpdate(Request $request){

        $request->validate([
            'name'=> 'required',
            'type' => 'required',
            'width'=>'required|integer|gt:0',
            'height' =>'required|integer|gt:0',
            'slug'=>'required',
        ]);

        $adType = AdType::findOrFail($request->id);
        $adType->name = $request->name;
        $adType->type = $request->type;
        $adType->width = $request->width;
        $adType->height = $request->height;
        $adType->slug = $request->width.'x'.$request->height;
        isset($request->status) ? $adType->status = 1 : $adType->status = 0;
        $adType->save();

        $notify[]=['success','Ad type has been updated successfully'];
        return back()->withNotify($notify);

    }
    // end ad type manage

    // ad manage

    public function fetchAd($id){

        $pageTitle = "Ads List";
        $adType = AdType::findOrFail($id);
        $ads = Ad::where('ad_type_id',$id)->latest()->paginate(getPaginate());
        return view('admin.ads.index',compact('pageTitle','ads','adType',));
    }

    public function store(Request $request){

        $request->validate([
            'title' => 'required',
            'url' => 'required|url',
            'image' => ['required', 'max:1024', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png', 'gif'])]
        ]);

        $adType = AdType::findOrFail($request->ad_type_id);
        $code = 'ad_'.$this->generateUniqueCode(4);

        if (!$this->isValidRedirectUrl($request->url)) {
            $notify[] = ['error', 'Invalid redirect URL'];
            return back()->withNotify($notify);
        }

        $ad =  new Ad();
        $ad->ad_type_id = $request->ad_type_id;
        $ad->ad_name = $adType->name;
        $ad->title = $request->title;
        $ad->redirect_url = $request->url;
        $ad->code = $code;
        $ad->status = 1;

        if ($request->file('image')) {
            $width = Image::make($request->image)->width();
            $height = Image::make($request->image)->height();
            $ad->resolution = $width . 'x' . $height;

            if ($adType->width != $width || $adType->height != $height) {
                $notify[] = ['error', 'Image resolution must be ' . $adType->width . 'x' . $adType->height . 'px'];
                return back()->withNotify($notify);
            } else {
                $ad->image = fileUploader($request->image, getFilePath('adImage'));
            }

        }

        $ad->save();

        $notify[] = ['success', 'Ad has been created successfully'];
        return back()->withNotify($notify);

    }

    public function update(Request $request){


        $request->validate([
            'title' => 'required',
            'url' => 'required|url',
            'image' => ['nullable', 'max:1024', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png', 'gif'])]
        ]);


        $adType = AdType::findOrFail($request->ad_type_id);

        if (!$this->isValidRedirectUrl($request->url)) {
            $notify[] = ['error', 'Invalid redirect URL'];
            return back()->withNotify($notify);
        }

        $ad =  Ad::findOrFail($request->id);
        $ad->ad_type_id = $request->ad_type_id;
        $ad->ad_name = $adType->name;
        $ad->title = $request->title;
        $ad->redirect_url = $request->url;
        $ad->status = $request->status;

        if ($request->file('image')) {
            $width = Image::make($request->image)->width();
            $height = Image::make($request->image)->height();
            $ad->resolution = $width . 'x' . $height;

            if ($adType->width != $width || $adType->height != $height) {
                $notify[] = ['error', 'Image resolution must be ' . $adType->width . 'x' . $adType->height . 'px'];
                return back()->withNotify($notify);
            } else {
                $old = $ad->image;
                $ad->image = fileUploader($request->image, getFilePath('adImage'),'',$old);
            }

        }

        $ad->save();

        $notify[] = ['success', 'Ad has been updated successfully'];
        return back()->withNotify($notify);

    }

    public function delete(Request $request){
        
        $ad = Ad::findOrFail($request->id);
        $thumbPath = getFilePath('adImage') . '/' . $ad->image;
        fileManager()->removeFile($thumbPath);
        $ad->delete();

        $notify[] = ['success', 'Ad has been deleted successfully'];
        return back()->withNotify($notify);

    }


    public function randomAd($redirectUrl, $adImage, $width, $height, $sitename)
    {
        return "<a class='atag' href='" . $redirectUrl . "' target='_blank'><img class='imagetag' src='" . $adImage . "' width='" . $width . "' height='" . $height . "'/></a><strong style='background-color:#e6e6e6;position:absolute;right:19px;top:0;font-size: 10px;color: #666666; padding:4px; margin-right:15px;'>Ads by " . $sitename . "</strong><span  onclick='hideAdverTiseMent(this)' style='position: absolute;
        right: -8px;
        top: -7px;
        background-color: #a75508;
        font-size: 15px;
        color: #fff;
        cursor: pointer;
        padding: 1px 10px;
        border-radius: 5px;'>x</span>";
    }

    protected function defaultAd($slug, $width, $height, $title)
    {
        $logo = route('placeholder.image', $slug);
        return "<a href='" . url('/') . "' target='_blank'><img src='" . $logo . "' width='" . $width . "' height='" . $height . "'/></a><strong style='background-color:#e6e6e6;position:absolute;right:0;top:0;font-size: 10px;color: #666666; padding:4px; margin-right:15px;'>Ads by " . $title . "</strong><span onclick='hideAdverTiseMent(this)' style='position: absolute;
        right: -8px;
        top: -7px;
        background-color: #a75508;
        font-size: 15px;
        color: #fff;
        cursor: pointer;
        padding: 1px 10px;
        border-radius: 5px;'>x</span>";
    }

    public function getAdvertise($adId, $slug,$adType)
    {
        $adId = Crypt::decryptString($adId);
        $adTypeId = Crypt::decryptString($adType);
        $adType = AdType::find($adTypeId);
        $ad = Ad::find($adId);
        $sitename = gs()->site_name;

        $width = $adType->width;
        $height = $adType->height;

        if(!empty($ad)){
            $redirectUrl = route('adClicked', [$adId]);
            $adImage = asset('assets/images/frontend/adImage') . '/' . $ad->image;
            return $this->randomAd($redirectUrl, $adImage, $width, $height, $sitename);
        }else{
            return $this->defaultAd($slug, $width, $height, $sitename);
        }

    }

    public function adClicked($adId)
    {
        $ad = Ad::find($adId);

        if ($ad && $this->isValidRedirectUrl($ad->redirect_url)) {
            return redirect($ad->redirect_url);
        }
        
        return redirect(url('/'));
    }

    protected function isValidRedirectUrl($url): bool
    {
        $host = parse_url($url, PHP_URL_HOST);
        if (!$host) {
            return false;
        }
        $allowed = config('ads.allowed_redirect_hosts', []);
        foreach ($allowed as $allowedHost) {
            if (strtolower($host) === strtolower($allowedHost)) {
                return true;
            }
        }
        return false;
    }


    protected function generateUniqueCode($length) {
        $characters = '0123456789abcdefghijklnopqrstuvwxyz';
        $randomCode = '';

        for ($i = 0; $i < $length; $i++) {
            $randomCode .= $characters[rand(0, strlen($characters) - 1)];
        }

        return $randomCode;
    }




}
