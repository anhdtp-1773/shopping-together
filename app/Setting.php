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
    protected $fillable=['id','id_shop', 'product_font_family', 'product_font_style', 'product_font_color', 'amount_font_family', 'amount_font_style',
    'amount_font_color', 'new_price_font_family', 'new_price_font_style', 'new_price_font_color','old_price_font_family', 'old_price_font_style',
    'old_price_font_color', 'title_font_family', 'title_font_style','title_font_color', 'cart_font_family','cart_font_style', 'cart_font_color',
    'back_ground_color', 'product_text', 'cart_text','active', 'show_product_qty', 'created_at','updated_at' ];

    public static function getSettingByShopId($shop_id){
        return DB::table('settings')->where('id_shop', $shop_id)->first();
    }
}