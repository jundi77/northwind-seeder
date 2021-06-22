<?php

namespace Database\Factories;

use App\Models\UsState;
use Illuminate\Database\Eloquent\Factories\Factory;

class UsStateFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = UsState::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $name = $this->faker->unique()->words(3, true);
        $abbr = $this->faker->unique('['.strtoupper($name).']{2}');

        # Asumsi id state autoincrement
        return [
            // 'state_id' => , // smallint NOT NULL,
            'state_name' => $name, // character varying(100),
            'state_abbr' => $abbr, // character varying(2),
            'state_region' => substr($this->faker->region(), 0, 50), // character varying(50)
        ];
    }
}
