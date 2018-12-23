<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'products';
    protected $fillable=['id','id_product_shopify','id_shop','title','created_at','updated_at','handle'];
    

    /**
     * @param
     * array(
     *  array (
     *  'id_product_shopify' => string,
     *  'id_shop' => int,
     *  'title' => string,
     *  'handle' => string,
     *  'src_img' => string,
     * ))
     */
    public static function saveProduct($array_products){
        DB::table('products')->insert($array_products);
    }   

    /**
     * @param string $id_product_shopify
     * @return array
     * <pre>
     * array (
     *  'id' => int,
     *  'id_product_shopify' => int,
     *  'id_shop' => varchar,
     *  'title' => varchar,
     *  'handle' => varchar,
     *  'created_at' => timestamp,
     *  'updated_at' => timestamp
     * )
     */
    public static function getProduct($id_product_shopify){
        return DB::table('products')->where('id_product_shopify', $id_product_shopify)->get();
    }
}
