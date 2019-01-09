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
                        if($request->products){
                            $products = array();
                            foreach($request->products as $product){
                                $products[] = array(
                                    'id_cart_rule' => $cart_rule->id,
                                    'id_shop' => $shop_info->id,
                                    'id_related_product' => isset($product['isMainProduct']) ? 0 : $product['id_shopify_product'],
                                    'id_main_product' => isset($product['isMainProduct']) ? $product['id_shopify_product'] : 0,
                                    'reduction_percent' => $request->is_percentage ? $product['numberDiscount'] : 0,
                                    'reduction_amount' => $request->is_percentage ? 0 : $product['numberDiscount'],
                                    'created_at' => date('Y-m-d H:i:s'),
                                    'updated_at' => date('Y-m-d H:i:s'),
                                );
                            }
                            CartRule::saveCartRuleDetail($products);
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