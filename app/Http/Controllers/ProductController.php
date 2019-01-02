<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Variant;
use App\Image;
use App\Shop;

class ProductController extends Controller
{
    public $page_number = 1;
    protected $items_per_page = 12;
    
    public function renderList(Request $request){
        $this->page_number = ($request->page_number) ? (int)$request->page_number : $this->page_number;
        $data = [];
        $status = true;
        $msg = trans('label.successfully');
        try{
            $data = Product::getProducts($this->page_number, $this->items_per_page);
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

    public function save(Request $request){
        $domain = request()->header('x-shopify-shop-domain');
        session(['shopify_domain' => $domain]);
        $response = json_decode(file_get_contents('php://input'));
        $shop = Shop::getShopByDomain($domain);

        $info_product = Product::getProduct($response->id);
        $id_variants = array();
        $arr_new_variants = array();
        $arr_products = array();
        $arr_variants = array();
        $arr_imgs = array();
        if($info_product){
            $product = Product::find($info_product->id);
            $product->title = $response->title;
            $product->handle = $response->handle;
            if($response->variants){
                foreach($response->variants as $variant){
                    array_push($id_variants, $variant->id); 
                    $arr_new_variants[] = array(
                        'title' => $variant->title,
                        'price' => $variant->price,
                        'option1' => $variant->option1,
                        'option2' => $variant->option2,
                        'option3' => $variant->option3,
                        'quantity' => $variant->inventory_quantity,
                    );
                }
                Variant::updatedVariant($id_variants, $arr_new_variants);
            }
        }else{
            $arr_products[] = array(
                'id_shopify_product' => $response->id,
                'id_shop' => $shop->id,
                'title' => $response->title,
                'handle' => $response->handle,
            );
            Product::saveProduct($arr_products);
            if($response->variants){
                foreach($response->variants as $variant){
                    $arr_variants[] = array(
                        'id_variant' => $variant->id,
                        'id_product' => $variant->product_id,
                        'id_shop' => $id_shop,
                        'title' => $variant->title,
                        'price' => $variant->price,
                        'option1' => $variant->option1,
                        'option2' => $variant->option2,
                        'option3' => $variant->option3,
                        'quantity' => $variant->inventory_quantity,
                        'id_image' => $value->image_id
                    );
                }
                Variant::saveVariant($arr_variants);
            }
            if($response->images){
                foreach($response->images as $img){
                    $arr_imgs[] = array(
                        'id_image' => $img->id,
                        'id_product' => $img->product_id,
                        'src' => $img->src,
                        'id_shop'=> $id_shop,
                    );
                }
                Image::saveImage($arr_imgs);
            }
        }
    }

    public function delete(Request $request){
        $response = json_decode(file_get_contents('php://input'));
        DB::table('products')->where('id_shopify_product', $response->id)->delete();
    }

    public function search(Request $request){
        $msg = '';
        $data = array();
        $status = true;
        $key_word = preg_replace('/[^A-Za-z0-9\-]/', '', isset($request->key_word) ? $request->key_word : null);
        if(!empty($key_word)){
            $products = Product::search($key_word);
            $status = $products ? true : false;
            $data = [
                'products' => $products,
            ];
            $msg = $products ? trans('label.find').' '.count($products).' '.trans('label.record') : trans('label.record_not_found') ;
        }
        return response()->json([
                'message'=> $msg,
                'data' => $data,
                'status' => $status,
        ], 200);
    }
}
