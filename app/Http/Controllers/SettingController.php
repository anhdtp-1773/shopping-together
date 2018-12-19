<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;
use App\Shop;

class SettingController extends Controller
{   

    public function index()
    {
        return view('app');
    }

    public function validateData($request)
    {
        $errors = array();
        $validator = \Validator::make($request->all(), [
            'product_font_color' =>'required', 
            'product_image_width' => 'required|integer', 
            'product_imgae_height' => 'required|integer', 
            'amount_font_color' => 'required', 
            'new_price_font_color' => 'required', 
            'old_price_font_color' => 'required', 
            'title_font_color' =>'required', 
            'cart_font_color' =>'required', 
            'back_ground_color' =>'required', 
            'product_text' =>'required', 
            'cart_text' =>'required', 
            'show_product_qty' =>'required|integer', 
        ]);

        if($validator->fails()){
            $errors = $validator->errors();
        }

        return $errors;
    }

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function save(Request $request)
    {
        $errors = $this->validateData($request);
        $result = '';

        if(!$errors)
        {
            $shop_info = Shop::getShopByDomain($request->shopify_domain);
            $shop = $shop_info ? Shop::find($shop_info->id) : null;

            if($shop && $shop->settings){
                $result = $shop->settings->update($request->all());

            }else{
                $stockTracking = new Setting($request->all());
                $result = $shop->settings()->save($settings);
            }
        }
        return response()->json([
            'message'=>$errors ? $errors: trans('label.update_successfully'),
            'data' => $result,
        ], 200);
        
    }
    
    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function get(Request $request){
        // dd($request);
        $setting_folder = './settings';
        $setting = '';
        if($request->shopify_domain){
            $shop_info = Shop::getShopByDomain($request->shopify_domain);
            if($shop_info){
                $shop_setting = Setting::getSettingByShopId($shop_info->id);
                $setting = $shop_setting ? $shop_setting : json_decode(file_get_contents($setting_folder.'/defaultSetting.json'), true);
            }
        }
        return response()->json([
            'message'=> $setting ? trans('label.update_successfully') : trans('label.un_successfully'),
            'data' => array(
            'setting' => $setting,
            )
        ], 200);
    }
}
