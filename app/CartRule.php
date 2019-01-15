<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class CartRule extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart_rule';
    protected $fillable=['id_shop','name','id_product','status','updated_at','created_at'];

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
    public static function saveCartRule($id_shop, $name, $id_product){
        $cart_rule = new CartRule();
        $cart_rule->id_shop = $id_shop;
        $cart_rule->name = $name;
        $cart_rule->id_product = $id_product;
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



    public static function getCartRule($id_shop, $id_product)
    {
        $sql = DB::table('cart_rule');
        $sql->select('variants.product_name','variants.id_variant', 'variants.id_image', 'variants.title', 'variants.price', 'cart_rule_detail.reduction_percent',
             'cart_rule_detail.reduction_amount', 'cart_rule_detail.id_product');
        $sql->join('cart_rule_detail', 'cart_rule_detail.id_cart_rule', '=', 'cart_rule.id');
        $sql->join('variants', 'variants.id_product', '=', 'cart_rule_detail.id_product');
        $sql->where('cart_rule.id_shop', $id_shop);
        $sql->where('cart_rule.id_product', $id_product);
        return $sql->get()->toArray();
    }

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
    public static function getRules($page_number, $items_per_page, $id_shop)
    {
        $data = [];
        $query = DB::table('cart_rule');
        $query->select('cart_rule.name', 'cart_rule.status');
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

    public static function search($key_word, $page_number, $items_per_page, $id_shop){
        $data = [];
        $query =  DB::table('cart_rule');
        $query->select('cart_rule.name', 'cart_rule.status');
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
}
