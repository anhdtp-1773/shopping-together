<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Shop;
use App\CartRule;

class CartRuleController extends Controller
{
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
                        $array_products = array();
                        if($request->products){
                            foreach($request->products as $product){
                                $array_products[] = array(
                                    'id_cart_rule' => $cart_rule->id,
                                    'id_shop' => $shop_info->id,
                                    'id_main_product' => isset($product->id_main_product) ? $product->id_main_product : '',
                                    'id_related_product' => isset($product->id_related_product) ? $product->id_related_product : '',
                                    'reduction_percent' => isset($product->reduction_percent),
                                    'reduction_amount' => isset($product->reduction_amount)
                                );
                            }
                            CartRule::saveCartRuleDetail($array_products);
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