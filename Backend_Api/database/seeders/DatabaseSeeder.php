<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(5)->create();

        User::factory()->create([
            'name' => 'Sudo',
            'email' => 'sudo@sudo.com',
            'role' => 'sudo',
        ]);
        User::factory()->create([
            'name' => 'Amr',
            'email' => 'amr@gmail.com',
        ]);
    }
}
