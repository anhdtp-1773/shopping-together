<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;
use App\Shop;

class SettingController extends Controller
{   
    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function save(Request $request)
    {
        $shop_info = Shop::getShopByDomain($request->shopify_domain);
        $shop = $shop_info ? Shop::find($shop_info->id) : null;
        $result = '';
        
        if($shop && $shop->settings){
            $result = $shop->settings->update($request->all());
        }else{
            $setting = new Setting($request->all());
            $result = $shop->settings()->save($setting);
        }
        return response()->json([
            'status' => $result,
            'message'=> 'success',
            'data' => $result,
            ], 200);
    }

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function getSetting(Request $request){
        $get_shop = Shop::getShopByDomain($request->shopify_domain);
        $data = '';

        if (!empty($get_shop)) {
            $data = Setting::getSettingByShopId($get_shop->id);
        }

        return response()->json([
            'message'=> 'success',
            'data' => $data,
            ], 200);
    }
}