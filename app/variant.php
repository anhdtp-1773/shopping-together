<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class Variant extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'variants';
    protected $fillable=['id_variant','id_product','id_shop','title','created_at','updated_at','price','option1','option2','option3','currency_code','quantity', 'id_image'];
    
    /**
     * @param
     * array(
     *  array (
     *  'id_variant' => string,
     *  'id_product' => int,
     *  'title' => string,
     *  'price' => string,
     *  'option1' => string,
     *  'option2' => string,
     *  'option3' => string,
     *  'currency_code' => string,
     *  'quantity' => string,
     * ))
     */
    public static function saveVariant($array_variants){
        DB::table('variants')->insert($array_variants);
    }   
    
    
    /**
     * @param
     * array(
     *  array (
     *  'id_variant' => string,
     *  'id_product' => int,
     *  'title' => string,
     *  'price' => string,
     *  'option1' => string,
     *  'option2' => string,
     *  'option3' => string,
     *  'currency_code' => string,
     *  'quantity' => string,
     * ))
     */
    public static function updatedVariant($id_variants, $array_variants){
        DB::table('variants')->whereIn('id_variant', $id_variants)->update($array_variants);
    }       
}
