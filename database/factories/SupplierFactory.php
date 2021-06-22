<?php

namespace Database\Factories;

use App\Models\Supplier;
use Illuminate\Database\Eloquent\Factories\Factory;

class SupplierFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Supplier::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        # Asumsi supplier_id autoincrement
        return [
        // 'supplier_id' => , // smallint NOT NULL
            'company_name' => substr($this->faker->company(), 0, 40),// character varying(40) NOT NULL,
            'contact_name' => substr($this->faker->name(), 0, 30),// character varying(30),
            'contact_title' => substr($this->faker->name(), 0, 30),// character varying(30),
            'address' => substr($this->faker->address(), 0, 60),// character varying(60),
            'city' => substr($this->faker->address(), 0, 15),// character varying(15),
            'region' => NULL,// character varying(15),
            'postal_code' => $this->faker->randomNumber(6, true),// character varying(10),
            'country' => substr($this->faker->country(), 0, 15),// character varying(15),
            'phone' => substr($this->faker->phoneNumber(), 0, 24),// character varying(24),
            'fax' => substr($this->faker->faxNumber(), 0, 24),// character varying(24)
            'homepage' => $this->faker->url(), // text
        ];
    }
}
