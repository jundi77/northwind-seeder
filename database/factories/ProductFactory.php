<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        #TODO
        $stock = $this->faker->numberBetween(6, 666);
        $order = $this->faker->numberBetween(0, $stock);

        # Asumsi id product auto increment
        return [
            // 'product_id' => , // smallint NOT NULL,
            'product_name' => substr($this->faker->words(3, true), 40), // character varying(40) NOT NULL,
            // 'supplier_id' => , // smallint, TODO
            // 'category_id' => , // smallint, TODO
            'quantity_per_unit' => $this->faker->bothify('## ??s - ## ??s'), // character varying(20),
            'unit_price' => $this->faker->randomFloat(5, 1, 100), // real,
            'units_in_stock' => $stock, // smallint,
            'units_on_order' => $order, // smallint,
            'reorder_level' => $this->faker->randomNumber(2), // smallint,
            'discontinued' => $this->faker->numberBetween(0, 1), // integer NOT NULL
        ];
    }
}
