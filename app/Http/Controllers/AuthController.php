<?php

namespace App\Http\Controllers;

use OhMyBrew\ShopifyApp\Facades\ShopifyApp;
use OhMyBrew\ShopifyApp\Jobs\ScripttagInstaller;
use OhMyBrew\ShopifyApp\Jobs\WebhookInstaller;
use App\ShopOwner;
use App\Shop;
use App\Product;
use App\Variant;
use App\Image;
use Illuminate\Http\Request;
use OhMyBrew\ShopifyApp\Traits\AuthControllerTrait;
use DB;

class AuthController extends Controller
{
    use AuthControllerTrait;
    protected function authenticationWithoutCode()
    {
        $shopDomain = session('shopify_domain');
        $api = ShopifyApp::api();
        $api->setShop($shopDomain);
        // Grab the authentication URL
        $api_redirect = urlencode(url(config('shopify-app.api_redirect')));
        if(config('shopify-app.mode')){
            $authUrl = $api->getAuthUrl(
                config('shopify-app.api_scopes'),
                url(config('shopify-app.api_redirect'))
            );
            $new_api_redirect = (!strpos(url(config('shopify-app.api_redirect')), "s:")) ? urlencode(substr_replace(url(config('shopify-app.api_redirect')), "s", 4, 0)) : $api_redirect;
        }else{
            $authUrl = $api->getAuthUrl(
                config('shopify-app.api_scopes'),
                config('shopify-app.domain')
            );
            $new_api_redirect = config('shopify-app.domain');
        }

        $scope = urlencode(config('shopify-app.api_scopes'));
        $key = config('shopify-app.api_key');
        // Do a fullpage redirect
        return view('auth.fullpage_redirect', [
            'scope' => $scope,
            'key' => $key,
            'api_redirect' => $new_api_redirect,
            'authUrl'    => $authUrl,
            'shopDomain' => $shopDomain,
        ]);
    }
    protected function authenticationWithCode()
    {
        $shop_domain = session('shopify_domain');
        $api = ShopifyApp::api();
        $api->setShop($shop_domain);

        // Check if request is verified
        if (!$api->verifyRequest(request()->all())) {
            // Not valid, redirect to login and show the errors
            return redirect()->route('login')->with('error', trans('label.Invalid_signature'));
        }
      
        // Save token to shop
        $shop = ShopifyApp::shop();
        if ($shop->trashed()) {
            $shop->restore();
            $shop->charges()->restore();
        }
        $shop->shopify_token = $api->requestAccessToken(request('code'));
        $shop->save();
        $id_shop = $shop->id;
        // Install webhooks and scripttags
        $this->installWebhooks();
        $this->installScripttags();

        // Run after authenticate job
        $this->afterAuthenticateJob();
        $shop = ShopifyApp::shop();
        $request = $shop->api()->request('GET', '/admin/shop.json');
        $shop_owner_info = ShopOwner::getShopOwnerByDomain($request->body->shop->email);
        $id_shop_owner = !empty($shop_owner_info) ? $shop_owner_info->id : $this->updateShop($request->body->shop);
        $id_shop_owner ? $this->updateShopOwner($id_shop, $id_shop_owner) : '';
        // Go to homepage of app
        return redirect()->route('home');
    }

     /**
     * @param  object $shop
     * @return  int
     */
    private function updateShop($shop){
        $shop_owner = new ShopOwner();
        $shop_owner->email = $shop->email;
        $shop_owner->name = $shop->name;
        $shop_owner->phone = $shop->phone;
        $shop_owner->address = $shop->address1;
        $shop_owner->save();
        return $shop_owner->id;
    }

    /**
     * @param  int $id_shop
     * @param  int $id_shop_owner
     * @return boolean         
     */
    private function updateShopOwner($id_shop, $id_shop_owner){
        $shop = Shop::find($id_shop);
        $shop->id_shop_owner = $id_shop_owner;
        $shop->save();
    }

    public function uninstall(Request $request) {
        $shop_domain = request()->header('x-shopify-shop-domain');
        $shop_info = Shop::getShopByDomain($shop_domain);
        if($shop_info){
            DB::table('shops')->where('id',  $shop_info->id)->delete();
            DB::table('products')->where('id',  $shop_info->id)->delete();
            DB::table('variants')->where('id',  $shop_info->id)->delete();
            DB::table('images')->where('id',  $shop_info->id)->delete();
        }
    }

    /**
     * @param  int $id_shop
     * @param  string $domain
     */
    public function cloneProducts(Request $request){
        $status = true;
        $msg = trans('label.update_successfully');
        session(['shopify_domain' => $request->shopify_domain]);
        $shop = ShopifyApp::shop();
        $id_shop = $shop->id;
        $products = $shop->api()->request('GET', '/admin/products.json')->body->products;
        if($products){
            try{
                $arr_products = array();
                $arr_variants  = array();
                $arr_imgs= array();
                foreach($products as $product){
                    $arr_products[] = array(
                        'id_shopify_product' => $product->id,
                        'id_shop' => $id_shop,
                        'title' => $product->title,
                        'handle' => $product->handle,
                    );
                    foreach($product->variants as $value){
                        $arr_variants[] = array(
                            'id_variant' => $value->id,
                            'id_product' => $value->product_id,
                            'id_shop' => $id_shop,
                            'title' => $value->title,
                            'price' => $value->price,
                            'option1' => $value->option1,
                            'option2' => $value->option2,
                            'option3' => $value->option3,
                            'quantity' => $value->inventory_quantity,
                            'id_image' => $value->image_id
                        );
                    }
                    if($product->images){
                        foreach($product->images as $value){
                            $arr_imgs[] = array(
                                'id_image' => $value->id,
                                'id_product' => $value->product_id,
                                'src' => $value->src,
                                'id_shop'=> $id_shop,
                            );
                        }
                    }
                }
                Product::saveProduct($arr_products);
                Variant::saveVariant($arr_variants);
                if($arr_imgs){
                    Image::saveImage($arr_imgs);
                }
            } 
            catch(\Exception $e){
                $status = false;
                $msg = $e->getMessage();
            }
        }
        return response()->json([
            'message' => $msg,
            'status' => $status,
        ], 200);
    }
}
