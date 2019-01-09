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
                    if($request->products){
                        $products = array();
                        $id_main_product = '';
                        foreach($request->products as $product){
                            if(isset($product['isMainProduct'])){
                                $id_main_product = $product['id_shopify_product'];
                            }
                        }
                        $cart_rule = CartRule::saveCartRule(
                            $shop_info->id,
                            $request->name,
                            $id_main_product
                        );
                        if($cart_rule){
                            foreach($request->products as $product){
                                $products[] = array(
                                    'id_cart_rule' => $cart_rule->id,
                                    'id_shop' => $shop_info->id,
                                    'id_product' => $product['id_shopify_product'],
                                    'reduction_percent' => $request->is_percentage ? $product['numberDiscount'] : 0,
                                    'reduction_amount' => $request->is_percentage ? 0 : $product['numberDiscount'],
                                    'is_main_product' => $product['isMainProduct'],
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

    public function get (Request $request) {
        $id_products = ["2050359885888","2049573421120","2049573584960"];
        $coms = [];
        $domain = $request->shopify_domain;
        $id_product = $request->id_product;
        $shop = Shop::getShopByDomain($domain);
        $data = CartRule::getCartRule($shop->id, $id_product);
        foreach($id_products as $id_product){
            foreach($data as $value){
                if($value->id_product == $id_product){
                    $coms[$id_product][] = $value;
                }
            }
        }
        return response()->json([
            'data' => $coms,
        ], 200); 
    }
}