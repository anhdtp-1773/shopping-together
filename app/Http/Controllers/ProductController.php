<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Variant;
use App\Image;
use App\Shop;

class ProductController extends Controller
{
    public function save(Request $request){
        $domain = request()->header('x-shopify-shop-domain');
        session(['shopify_domain' => $domain]);
        $response = json_decode(file_get_contents('php://input'));
        $shop = Shop::getShopByDomain($domain);
        if($response){
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
                    'id_product_shopify' => $$response->id,
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
    }

    public function delete(Request $request){
        $response = json_decode(file_get_contents('php://input'));
        if($response->id){
            DB::table('products')->where('id_product', $response->id)->delete();
        }
    }
}
