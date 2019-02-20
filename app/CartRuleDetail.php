<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class CartRuleDetail extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart_rule_detail';
    protected $fillable=['id_cart_rule','id_shop','id_product','is_main_product','updated_at','created_at'];

    public static function add ($id_cart_rule, $id_shop, $id_product, $is_main_product) {
        $sql = new CartRuleDetail();
        $sql->id_cart_rule = $id_cart_rule;
        $sql->id_shop = $id_shop;
        $sql->id_product = $id_product;
        $sql->is_main_product = $is_main_product;
        $sql->save();
    }
}