<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Shop;
use App\CartRule;

class CartRuleController extends Controller
{
    public $page_number = 1;
    protected $items_per_page = 5;

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

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
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

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function getRulesList(Request $request){
        $this->page_number = ($request->page_number) ? (int)$request->page_number : $this->page_number;
        $data = [];
        $status = true;
        $msg = trans('label.successfully');
        $shop = Shop::getShopByDomain($request->shopify_domain);
        try{
            $data = CartRule::getRules($this->page_number, $this->items_per_page, $shop->id);
        }
        catch(\Exception $e){
            $status = false;
            $msg = $e->getMessage();
        }
        return response()->json([
                'status' => $status,
                'message'=> $msg,
                'data' => $data
        ], 200);
    }

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request){
        $this->page_number = ($request->page_number) ? (int)$request->page_number : $this->page_number;
        $msg = '';
        $data = array();
        $status = true;
        $key_word = preg_replace('/[^A-Za-z0-9\-]/', '', isset($request->key_word) ? $request->key_word : null);
        $shop = Shop::getShopByDomain($request->shopify_domain);
        if(!empty($key_word)){
            $data = CartRule::search($key_word, $this->page_number, $this->items_per_page, $shop->id);
            $status = $data['items'] ? true : false;
            $msg = $data['items'] ? trans('label.find').' '.count($data['items']).' '.trans('label.record') : trans('label.rule_not_found') ;
        }
        return response()->json([
                'message'=> $msg,
                'data' => $data,
                'status' => $status,
        ], 200);
    }
}