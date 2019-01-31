<?php

namespace App;
use DB;

use Illuminate\Database\Eloquent\Model;

class Stats extends Model
{
      /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'stats';
    protected $fillable=['id','id_shop','id_cart_rule','nb_view','nb_order','nb_sale','created_at','updated_at'];

    public static function addViewCartRule ($id_cart_rule, $id_shop)   
    {   
        $curent_date = date('Y-m-d');
        $stats = DB::table('stats');
        $stats->where('id_cart_rule', $id_cart_rule);
        $stats->where('id_shop', $id_shop);
        $stats->whereBetween('created_at', ["$curent_date 00:00:00", "$curent_date 23:59:59"]);
        $stats_nb = $stats->first();
        if($stats_nb){
            $new_stast = Stats::find($stats_nb->id);
            $new_stast->nb_view = $stats_nb->nb_view + 1;
            $new_stast->save();
        }else{
            $stats = new Stats();
            $stats->id_shop = $id_shop;
            $stats->id_cart_rule = $id_cart_rule;
            $stats->nb_view = 1;
            $stats->created_at = date('Y-m-d H:i:s');
            $stats->updated_at = date('Y-m-d H:i:s');
            $stats->save();
        }
    }
}