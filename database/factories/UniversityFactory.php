<?php

namespace Database\Factories;

use App\Models\University;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UniversityFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = \App\Models\University::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'universityID' => $this->faker->unique()->name(10),
            'university_name' => $this->faker->unique()->name(50),
            'vice_chancellor' => $this->faker->unique()->name(30)
        ];
    }
}
