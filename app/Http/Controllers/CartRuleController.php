<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Shop;
use App\CartRule;

class CartRuleController extends Controller
{
    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function save(Request $request)
    {
        $status = true;
        $msg = trans('label.update_successfully');
        $validator = \Validator::make($request->all(), [
            'name' => 'required',
        ]);
        if($validator->fails()){
            $msg = $validator->errors();
            $status = false;
        }
        if($status){
            try{
                $shop_info = Shop::getShopByDomain($request->shopify_domain);
                if($shop_info){
                    $cart_rule = CartRule::saveCartRule(
                        $shop_info->id,
                        $request->name
                    );
                    if($cart_rule){
                        $related_products = array();
                        if($request->related_products){
                            foreach($request->related_products as $product){
                                $related_products[] = array(
                                    'id_cart_rule' => $cart_rule->id,
                                    'id_shop' => $shop_info->id,
                                    'id_related_product' => $product['id_shopify_product'],
                                    'reduction_percent' => isset($product['reductionPercent']) ? (float)$product['reductionPercent'] : 0,
                                    'reduction_amount' => isset($product['reductionAmount']) ? (float)$product['reductionAmount'] : 0,
                                );
                            }
                            CartRule::saveCartRuleDetail($related_products);
                        }
                        $main_product = array();
                        if($request->main_product){
                            $main_product = array(
                                'id_cart_rule' => $cart_rule->id,
                                'id_shop' => $shop_info->id,
                                'id_main_product' => $request->main_product['id_shopify_product'],
                                'reduction_percent' => isset($request->main_product['reductionPercent']) ? (float)$request->main_product['reductionPercent'] : 0,
                                'reduction_amount' => isset($request->main_product['reductionAmount']) ? (float)$request->main_product['reductionAmount'] : 0,
                            );
                            CartRule::saveCartRuleDetail($main_product);
                        }
                    }
                }
            }
            catch(\Exception $e){
                $status = false;
                $msg = $e->getMessage();
            }
            
        }

        return response()->json([
            'message' => $msg,
            'status' => $status,
        ], 200); 
    }
}