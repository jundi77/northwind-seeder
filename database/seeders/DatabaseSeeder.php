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
        $maxAll = 2000;

        $jobs = [
            function() {
                # loop sendiri karena kena limit kombinasi 2 abjad
                for ($i=0; $i < 300; $i++) { 
                    UsState::factory(1)->create();
                }
            }
        ];

        for ($i=0; $i < $maxAll/100; $i++) { 
            array_push($jobs, function() use($max) {Category::factory($max)->create();});
            array_push($jobs, function() use($max) {Supplier::factory($max)->create();});
            array_push($jobs, function() use($max) {Product::factory($max)->create();});
            array_push($jobs, function() use($max) {Customer::factory($max)->create();});
            array_push($jobs, function() use($max) {Shipper::factory($max)->create();});
            array_push($jobs, function() use($max) {Region::factory($max)->create();});
            array_push($jobs, function() use($max) {Territory::factory($max)->create();});
            array_push($jobs, function() use($max) {Employee::factory($max)->create();});
            array_push($jobs, function() use($max) {EmployeeTerritory::factory($max)->create();});
        }

        for ($i=0; $i < 1000500 / $max; $i++) { 
            array_push($jobs,function() use($max) {Order::factory($max)->create();});
        }

        $Fork = Fork::new()->concurrent(5);
        call_user_func_array([$Fork, "run"], $jobs);

        echo "Getting order...";
        $maxOrder = Order::count();
        echo ''.$maxOrder."\n";

        echo "Getting product...";
        $maxProduct = Product::count();
        $products = Product::select('unit_price')->get();
        echo ''.$maxProduct."\n";

        for ($i = 1; $i <= $maxOrder; ++$i) {
            echo 'Inserting for order '.$i."\n";
			$product = rand() % $maxProduct + 1;
            try {
                OrderDetail::insert([
                        'order_id' => $i,
                        'product_id' => $product,
                        'unit_price' => $products[$product]->unit_price,
                        'quantity' => 1,
                        'discount' => 0,
                ]);
            } catch (\Throwable $th) {
	    		echo "Insert for order ".$i." fail\n";
            }
			echo "Insert for order ".$i." done\n";
        }
    }
}
