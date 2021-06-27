<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Customer;
use App\Models\Employee;
use App\Models\EmployeeTerritory;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Region;
use App\Models\Shipper;
use App\Models\Supplier;
use App\Models\Territory;
use App\Models\UsState;
use Illuminate\Database\Seeder;
use Spatie\Fork\Fork;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $max = 100;
        $maxAll = 4000000;
        $increments = $maxAll /$max;

        $jobs = [];
        for (; $max < $maxAll; $max+=$increments) { 
            array_push($jobs, function() use($max) {Category::factory($max)->create();});
            array_push($jobs, function() use($max) {Supplier::factory($max)->create();});
            array_push($jobs, function() use($max) {Product::factory($max)->create();});
            array_push($jobs, function() use($max) {Customer::factory($max)->create();});
            array_push($jobs, function() use($max) {Shipper::factory($max)->create();});
            array_push($jobs, function() use($max) {Region::factory($max)->create();});
            array_push($jobs, function() use($max) {Territory::factory($max)->create();});
            array_push($jobs, function() use($max) {Employee::factory($max)->create();});
            array_push($jobs, function() use($max) {EmployeeTerritory::factory($max)->create();});
            array_push($jobs, function() use($max) {
                for ($i=0; $i < $max; $i++) { 
                    UsState::factory(1)->create();
                }
            });
            array_push($jobs,function() use($max) {Order::factory($max)->create();});
            array_push($jobs,function() use($max) {
                for ($i=0; $i < $max; $i++) { 
                    OrderDetail::factory(1)->create();
                }
            });
        }

        $Fork = Fork::new()->concurrent(80);

        call_user_func_array([$Fork, "run"], $jobs);
    }
}
