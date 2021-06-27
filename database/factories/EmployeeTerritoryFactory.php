<?php

namespace Database\Factories;

use App\Models\Employee;
use App\Models\EmployeeTerritory;
use App\Models\Territory;
use Illuminate\Database\Eloquent\Factories\Factory;

class EmployeeTerritoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = EmployeeTerritory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'employee_id' => Employee::inRandomOrder()->first()->employee_id,
            'territory_id' => Territory::inRandomOrder()->first()->territory_id,
        ];
    }
}
