<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class CartRule extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart_rule';
    protected $fillable=['id_shop','name','status','updated_at','created_at'];
}
