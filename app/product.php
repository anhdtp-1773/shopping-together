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
    protected $fillable=['id','id_shopify_product','id_shop','title','created_at','updated_at','handle'];
    

    /**
     * @param
     * array(
     *  array (
     *  'id_shopify_product' => string,
     *  'id_shop' => int,
     *  'title' => string,
     *  'handle' => string,
     *  'src_img' => string,
     * ))
     */
    public static function saveProduct($array_products){
        return DB::table('products')->insert($array_products);
    }   

    /**
     * @param string $id_shopify_product
     * @return array
     * <pre>
     * array (
     *  'id' => int,
     *  'id_shopify_product' => int,
     *  'id_shop' => varchar,
     *  'title' => varchar,
     *  'handle' => varchar,
     *  'created_at' => timestamp,
     *  'updated_at' => timestamp
     * )
     */
    public static function getProduct($id_shopify_product){
        return DB::table('products')->where('id_shopify_product', $id_shopify_product)->get();
    }
}
