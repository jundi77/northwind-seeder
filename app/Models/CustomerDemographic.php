<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerDemographic extends Model
{
    use HasFactory;

    protected $primaryKey = 'customer_type_id';
    public $incrementing = false;

    public $timestamps = false;
}
