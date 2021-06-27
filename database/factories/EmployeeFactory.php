<?php

namespace Database\Factories;

use App\Models\Employee;
use Illuminate\Database\Eloquent\Factories\Factory;

class EmployeeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Employee::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $firstName = $this->faker->firstNameMale();
        $lastName = $this->faker->lastName();

        # asumsi id autoincrement
        return [
            // 'employee_id' => , // smallint NOT NULL,
            'last_name' => $lastName, // character varying(20) NOT NULL,
            'first_name' => $firstName, // character varying(10) NOT NULL,
            'title' => substr($this->faker->jobTitle(), 0, 30), // character varying(30),
            'title_of_courtesy' => $this->faker->title(), // character varying(25),
            'birth_date' => $this->faker->dateTimeThisCentury()->format('Y-m-d'), // date,
            'hire_date' =>  $this->faker->dateTimeThisDecade()->format('Y-m-d'), // date,
            'address' => substr($this->faker->address(), 0, 60), // character varying(60),
            'city' => substr($this->faker->city(), 0, 15), // character varying(15),
            'region' => strtoupper($this->faker->lexify('??')), // character varying(15),
            'postal_code' => substr($this->faker->postcode(), 0, 10), // character varying(10),
            'country' => substr($this->faker->country(), 0, 15), // character varying(15),
            'home_phone' => substr($this->faker->phoneNumber(), 0, 24), // character varying(24),
            'extension' => $this->faker->numerify('####'), // character varying(4),
            'photo' => '\x', // bytea,
            'notes' => $this->faker->text(150), // text,
            'reports_to' => $this->faker->randomElement([2, 5]), // smallint,
            'photo_path' => 'http://accweb/emmployees/davolio.bmp', // character varying(255)
        ];
    }
}
