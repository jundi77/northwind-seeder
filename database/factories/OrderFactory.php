<?php

namespace Database\Factories;

use App\Models\Customer;
use App\Models\Employee;
use App\Models\Order;
use App\Models\Shipper;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $employee = Employee::inRandomOrder()->first();
        $ship = Shipper::inRandomOrder()->first();

        # asumsi id order autoincrements
        return [
            // 'order_id' => ,
            'customer_id' => Customer::inRandomOrder()->first()->customer_id,
            'employee_id' => $employee->employee_id,
            'order_date' => $this->faker->dateTimeThisCentury()->format('Y-m-d'),
            'required_date' => $this->faker->dateTimeThisCentury()->format('Y-m-d'),
            'shipped_date' => $this->faker->dateTimeThisCentury()->format('Y-m-d'),
            'ship_via' => $ship->shipper_id,
            'freight' => $this->faker->randomFloat(7, 32, 1000),
            'ship_name' => substr($this->faker->name(), 0, 40), // character varying(40),
            'ship_address' => substr($this->faker->address(), 0, 60), // character varying(60),
            'ship_city' => substr($this->faker->city(), 0, 15), // character varying(15),
            'ship_region' => NULL, // character varying(15),
            'ship_postal_code' => $this->faker->randomNumber(6, true), // character varying(10),
            'ship_country' => substr($this->faker->country(), 0, 15)// , character varying(15)
        ];
    }
}
