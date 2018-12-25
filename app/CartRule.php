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
    protected $fillable=['id_shop','name','status','updated_at','created_at'];

    public static function saveCartRule($id_shop, $name, $status){
        $cart_rule = new CartRule();
        $cart_rule->id_shop = $id_shop;
        $cart_rule->name = $name;
        $cart_rule->status = $status;
        $cart_rule->save();
        return $cart_rule;
    }

    public static function saveCartRuleDetail($array_products)
    {
        DB::table('cart_rule_detail')->insert($array_products);
    }

}
