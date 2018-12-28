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
    public static function getFirstProduct($id_shop){
        return DB::table('products')->where('id_shop', $id_shop)->first();
    }
    
    /**
     * @param int $page_number
     * @param int $items_per_page
     * @return array
     * <pre>
     *  array (
     *  'page_limit' => int,
     *  'current_page' => int,
     *  'items_per_page' => string,
     *  'handle' => string,
     *  'total_items' => string,
     *  'items' => array(
     *      'title' => string,
     *       ......
     *  )
     * )
     */
    public static function getProducts($page_number, $items_per_page)
    {
        $data = [];
        $query = DB::table('products');
        $total = $query->count();
        $data['page_limit'] = ceil($total / $items_per_page);
        $data['current_page'] = $page_number;
        $offset = ($page_number - 1)  * $items_per_page;
        $data['items_per_page'] = $items_per_page;
        $data['total_items'] = $total;
        if($offset >=0 && $items_per_page){
            $data['items'] = $query->offset($offset)->limit($items_per_page)->get();
        }else{
            $data['items'] = $query->get();
        }
        return $data;
    }
    public static function get($id_shopify_product){
        $query = DB::table('products')->where('id_shopify_product', $id_shopify_product)
                    ->join('images', 'products.id_shopify_product', '=', 'images.id_product')
                    ->join('variants', 'products.id_shopify_product', '=', 'variants.id_product')
                    ->select('products.title', 'images.src', 'variants.price', 'variants.option1', 'variants.option2', 'variants.option3')
                    ->first();
        return $query;
    }
    public static function search($key_word){
        return DB::table('products')
        ->select('products.*', 'variants.price', 'images.src')
        ->join('variants', 'variants.id_product', '=', 'products.id_shopify_product')
        ->join('images', 'images.id_product', '=', 'products.id_shopify_product')
        ->where('products.title', 'like', '%'.$key_word.'%')
        ->groupBy('products.id_shopify_product')
        ->get()->toArray();
    }
}
