<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Shop;
use App\CartRule;
use App\Variant;
use DB;

class CartRuleController extends Controller
{
    public $page_number = 1;
    protected $items_per_page = 10;

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
                            if(($product['isMainProduct']) == true){
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
        $domain = $request->shopify_domain;
        $id_product = $request->id_product;
        $shop = Shop::getShopByDomain($domain);
        $cart_rules = CartRule::getCartRule($shop->id, $id_product);
        foreach($cart_rules as $key=>$cart_rule){
            $cart_rules[$key]->variants =  Variant::getVariant($cart_rule->id_product);
        }
        return response()->json([
            'data' => $cart_rules,
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
            foreach($data['items'] as $key=>$cart_rule){
                $data['items'][$key]->is_selected = false;
            }
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

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function changeStatusOfRule( Request $request){
        $msg = trans('label.update_successfully');
        $status = true;
        $id_cart_rules = is_array($request->id_cart_rules) ? $request->id_cart_rules : array($request->id_cart_rules);
        // dd($id_cart_rules);
        // var_dump($request->status);
        // dd($request->status);
        try{
            DB::table('cart_rule')->whereIn('id', $id_cart_rules)
           
            ->update([
                'status' => (int)$request->status,
            ]); 
            // DB::table('cart_rule_detail')->whereIn('id_cart_rule', $id_cart_rules)->update([
            //     'status' => 0,
            // ]); 
        }
            catch(\Exception $e){
                $msg = $e->getMessage();
                $status = false;
            }
            return response()->json([
                'message'=> $msg,
                'status' => $status,
            ], 200);
    }

    /**
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function deleteRule( Request $request){
        $msg = trans('label.delete_successfully');
        $status = true;
        $id_cart_rules = is_array($request->id_cart_rules) ? $request->id_cart_rules : array($request->id_cart_rules);
        try{
            DB::table('cart_rule')->whereIn('id', $id_cart_rules)->delete(); 
            DB::table('cart_rule_detail')->whereIn('id_cart_rule', $id_cart_rules)->delete(); 
        }
        catch(\Exception $e){
            $msg = $e->getMessage();
            $status = false;
        }
        return response()->json([
            'message'=> $msg,
            'status' => $status,
        ], 200);
    }
}