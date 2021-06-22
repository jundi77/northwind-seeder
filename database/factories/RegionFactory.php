<?php

namespace Database\Factories;

use App\Models\Region;
use Illuminate\Database\Eloquent\Factories\Factory;

class RegionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Region::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        # Asumsi id autoincrement
        return [
            // 'region_id' => , // smallint NOT NULL,
            'region_description' => $this->faker->unique()->word(), // bpchar NOT NULL
        ];
    }
}
