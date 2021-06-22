<?php

namespace Database\Factories;

use App\Models\Territory;
use Illuminate\Database\Eloquent\Factories\Factory;

class TerritoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Territory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        # TODO
        # Asumsi territory_id autoincrements
        return [
            // 'territory_id' => , // character varying(20) NOT NULL,
            // 'region_id' => , // smallint NOT NULL TODO
            'territory_description' => $this->faker->text(150), // bpchar NOT NULL,
        ];
    }
}
