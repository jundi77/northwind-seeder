<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeTerritory extends Model
{
    use HasFactory;

    protected $primaryKey = [
        'employee_id',
        'territory_id'
    ];

    public $incrementing = false;
    public $timestamps = false;
}
