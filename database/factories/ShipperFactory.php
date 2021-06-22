<?php

namespace Database\Factories;

use App\Models\Shipper;
use Illuminate\Database\Eloquent\Factories\Factory;

class ShipperFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Shipper::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        # Asumsi shipper_id autoincrement
        return [
            // 'shipper_id' => , // smallint NOT NULL,
            'company_name' => substr($this->faker->company(), 0, 40), // character varying(40) NOT NULL,
            'phone' => substr($this->faker->phoneNumber(), 0, 24), // character varying(24)
        ];
    }
}
