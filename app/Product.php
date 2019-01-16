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

    /**
     * @param int $id_shop
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
    public static function getProducts($page_number, $items_per_page, $id_shop)
    {
        $data = [];
        $query = DB::table('products');
        $query->select('products.*', 'variants.price', 'images.src', 'currency.currency');
        $query->join('variants', 'variants.id_product', '=', 'products.id_shopify_product');
        $query->join('currency', 'currency.id_shop', '=', 'products.id_shop');
        $query->join('images', 'images.id_product', '=', 'products.id_shopify_product');
        $query->where('products.id_shop', $id_shop);
        $query->groupBy('products.id_shopify_product');
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
     * @param string $id_shopify_product
     * @return array
     * <pre>
     *  array (
     *  'title' => string,
     *  'src' => varchar,
     *  'price' => varchar,
     *  'option1' => varchar,
     *  'option1' => varchar,
     *  'option1' => varchar,
     * )    
     */
    public static function get($id_shopify_product){
        return DB::table('products')->where('id_shopify_product', $id_shopify_product)
                    ->join('images', 'products.id_shopify_product', '=', 'images.id_product')
                    ->join('variants', 'products.id_shopify_product', '=', 'variants.id_product')
                    ->select('products.title', 'images.src', 'variants.price', 'variants.option1', 'variants.option2', 'variants.option3')
                    ->first();
    }
    

    /**
     * @param int $page_number
     * @param int $items_per_page
     * @param string $key_word
     * @param int $id_shop
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
    public static function search($key_word, $page_number, $items_per_page, $id_shop){
        $data = [];
        $query =  DB::table('products');
        $query->select('products.*', 'variants.price', 'images.src', 'currency.currency');
        $query->join('variants', 'variants.id_product', '=', 'products.id_shopify_product');
        $query->join('images', 'images.id_product', '=', 'products.id_shopify_product');
        $query->join('currency', 'currency.id_shop', '=', 'products.id_shop');
        $query->where('products.id_shop', $id_shop);
        $query->where('products.title', 'like', '%'.$key_word.'%');
        $query->groupBy('products.id_shopify_product');
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
