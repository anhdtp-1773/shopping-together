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

    public static function getCartRule($id_shop, $id_product) {
        $sql = DB::table('cart_rule');
        $sql->select('cart_rule_detail.reduction_percent', 'cart_rule_detail.reduction_amount', 'cart_rule_detail.id_product', 'cart_rule_detail.is_main_product');
        $sql->join('cart_rule_detail', 'cart_rule_detail.id_cart_rule', '=', 'cart_rule.id');
        $sql->where('cart_rule.status', 1);
        $sql->where('cart_rule.id_shop', $id_shop);
        $sql->where('cart_rule.id_product', $id_product);
        return $sql->get()->toArray();
    }
    
    public function getRuleDetail($id_cart_rule) {
        $sql = DB::table('cart_rule');
        $sql->join('images', 'images.id_image', '=', 'cart_rule.id');
        $sql->where('cart_rule.id_shop', $id_shop);
        $sql->where('cart_rule.id_product', $id_product);
        return $sql->first();
    }
}
