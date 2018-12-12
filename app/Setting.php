<?php

namespace App;
use DB;

use Illuminate\Database\Eloquent\Model;
 
class Setting extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'settings';
    protected $fillable=['id','id_shop', 'product_font','product_style','product_size','product_color','product_image_width','product_imgae_height',
     'amount_font','amount_style','amount_size','amount_color', 'new_price_font', 'new_price_style', 'new_price_size', 'new_price_color',
     'old_price_font', 'old_price_style', 'old_price_size','old_price_color','title_font', 'title_style', 'title_size','title_color',
     'cart_font','cart_style', 'cart_size', 'cart_color', 'cart_text','active', 'show_product_qty', 'created_at','updated_at' ];

    public static function getSettingByShopId($shop_id){
        return DB::table('settings')->where('id_shop', $shop_id)->first();
    }
}