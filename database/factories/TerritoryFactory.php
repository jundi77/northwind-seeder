<?php

namespace Database\Factories;

use App\Models\Region;
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
        # Asumsi territory_id autoincrements
        return [
            'territory_id' => $this->faker->regexify('[A-Z0-9-_]{15}'), // character varying(20) NOT NULL,
            'region_id' => Region::inRandomOrder()->first()->region_id, // smallint NOT NULL TODO
            'territory_description' => $this->faker->text(150), // bpchar NOT NULL,
        ];
    }
}
