<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;
use OhMyBrew\ShopifyApp\Facades\ShopifyApp;

class CartRule extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart_rule';
    protected $fillable=['id_shop','name','code','id_product','status','reduction_percent','start_date','end_date','updated_at','created_at'];

     /**
     * @param int $id_shop
     * @param int $name
     * @return array
     * <pre>
     * array (
     *  'id' => int,
     *  'id_shop' => int,
     *  'name' => string,
     *  'status' => tinyint,
     *  'created_at' => timestamp,
     *  'updated_at' => timestamp
     * )
     */
    public static function saveCartRule($id_shop, $name, $code, $id_product, $reduction_percent, $start_date, $end_date, $id_price_rule_shopify){
        $cart_rule = new CartRule();
        $cart_rule->id_shop = $id_shop;
        $cart_rule->name = $name;
        $cart_rule->code = $code;
        $cart_rule->id_product = $id_product;
        $cart_rule->reduction_percent = $reduction_percent;
        $cart_rule->start_date = $start_date;
        $cart_rule->end_date = $end_date;
        $cart_rule->id_price_rule_shopify = $id_price_rule_shopify;
        $cart_rule->save();
        return $cart_rule;
    }

    /**
     * @param
     * array(
     *  array (
     *  'id_cart_rule' => int,
     *  'id_shop' => int,
     *  'id_main_product' => string,
     *  'id_related_product' => string,
     *  'reduction_percent' => string,
     *  'reduction_amount' => string,
     * ),)
     */
    public static function saveCartRuleDetail($array_products)
    {
        DB::table('cart_rule_detail')->insert($array_products);
    }
    
     /**
     * @param int $id_shop
     * @param string $id_product
     * @return array
     * <pre>
     *  array (
     *  'reduction_percent' => int,
     *  'reduction_amount' => int,
     *  'id_product' => varchar,
     *  'is_main_product' => varchar,
     * )    
     */
    public static function getCartRule($id_shop, $id_product) {
        $sql = DB::table('cart_rule');
        $sql->select('cart_rule_detail.id_product', 'cart_rule_detail.is_main_product','cart_rule.name','cart_rule.code','cart_rule.status','cart_rule.reduction_percent',
                    'cart_rule.start_date','cart_rule.end_date');
        $sql->join('cart_rule_detail', 'cart_rule_detail.id_cart_rule', '=', 'cart_rule.id');
        $sql->where('cart_rule.status', 1);
        $sql->where('cart_rule.id_shop', $id_shop);
        $sql->where('cart_rule.id_product', $id_product);
        return $sql->get()->toArray();
    }

    /**
     * @param int $page_number
     * @param int $items_per_page 
     * @param int $id_shop 
     * @return array
     * <pre>
     * array (
     *  'page_limit' => int,
     *  'current_page' => int,
     *  'items_per_page' => int,
     *  'total_items' => int,
     *  'items' => array(
     *       'name' => varchar,
     *       'status' => tinyint,
     *  )
     * )
     */
    public static function getRules($page_number, $items_per_page, $id_shop)
    {
        $data = [];
        $query = DB::table('cart_rule');
        $query->where('cart_rule.id_shop', $id_shop);
        $number_record = count($query->get());
        $data['page_limit'] = ceil($number_record / $items_per_page);
        $data['current_page'] = $page_number;
        $offset = ($page_number - 1)  * $items_per_page;
        $data['items_per_page'] = $items_per_page;
        $data['total_items'] = $number_record;
        if($offset >=0 && $items_per_page){
            $data['items'] = $query->offset($offset)->limit($items_per_page)->get();
        }else{
            $data['items'] = $query->get();
        }
        return $data;
    }

    /**
     * @param string $key_word
     * @param int $page_number
     * @param int $items_per_page
     * @param int $id_shop
     * @return array
     * <pre>
     * array (
     *  'page_limit' => int,
     *  'current_page' => int,
     *  'items_per_page' => int,
     *  'total_items' => int,
     *  'items' => array(
     *       'name' => varchar,
     *       'status' => tinyint,
     *  )
     * )
     */
    public static function search($key_word, $page_number, $items_per_page, $id_shop){
        $data = [];
        $query =  DB::table('cart_rule');
        $query->where('cart_rule.id_shop', $id_shop); 
        $query->where('cart_rule.name', 'like', '%'.$key_word.'%'); 
        $number_record = count($query->get());
        $data['page_limit'] = ceil($number_record / $items_per_page);
        $data['current_page'] = $page_number;
        $offset = ($page_number - 1)  * $items_per_page;
        $data['items_per_page'] = $items_per_page;
        $data['total_items'] = $number_record;
        if($offset >=0 && $items_per_page){
            $data['items'] = $query->offset($offset)->limit($items_per_page)->get()->toArray();
        }else{
            $data['items'] = $query->get()->toArray();
        }
        return $data;
    }

    public static function saveCartRuleOnShopify ($id_main_product, $id_related_product, $code, $value, $start_date, $end_date) {
        $shop = ShopifyApp::shop();
        $price_rule = $shop->api()->request('POST', '/admin/price_rules.json',
                [
                    "price_rule" => [
                        "title" => $code,
                        "value_type" => "percentage",
                        "value" => "-$value",
                        "customer_selection" => "all",
                        "target_type" => "line_item",
                        "target_selection"=> "entitled",
                        "allocation_method"=> "each",
                        "starts_at"=> $start_date,
                        "ends_at"=> $end_date,
                        "prerequisite_product_ids" => [
                            $id_main_product
                        ],
                        "entitled_product_ids" => $id_related_product,
                        "prerequisite_to_entitlement_quantity_ratio" => [
                            "prerequisite_quantity" => 1,
                            "entitled_quantity" => 1
                        ],
                        "allocation_limit"=> null
                    ]
                ]
        )->body->price_rule;
        $discount_code = $shop->api()->request('POST', '/admin/price_rules/'.$price_rule->id.'/discount_codes.json',["discount_code" => ["code" => $price_rule->title]])->body->discount_code;
        return $discount_code;
    }

    public static function getRuleName ($id_shop) {
        return DB::table('cart_rule')->select('name')->where('id_shop', $id_shop)->get()->toArray();
    }
}
