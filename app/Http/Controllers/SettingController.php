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
        $settings_folder = './settings';
        $shop = '';
        if($request->shopify_domain){
            $shop_info = Shop::getShopByDomain($request->shopify_domain);
            if($shop_info){
                $shop = Shop::find($shop_info->id);
                $setting = Setting::getSettingByShopId($shop_info->id);
                $shop->setting = !empty($setting) ? $setting : json_decode(file_get_contents($settings_folder.'/setting.json'), true);
            }
        }
        return response()->json([
            'message'=> $shop ? 'update_successfully' : 'un_successfully',
            'data' => array(
                'setting' => $shop,
            )
        ], 200);
    }
}