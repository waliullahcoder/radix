<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // 🔥 Admin User
        $admin = User::create([
            'name' => "Admin",
            'user_name' => "admin",
            'role_status' => 1,
            'phone' => "01711111111",
            'email' => "admin@gmail.com",
            'password' => Hash::make("12345678"),
        ]);

        $adminRole = Role::firstOrCreate(['name' => 'Software Admin']);
        $admin->assignRole($adminRole);


        // 🔥 Manager User
        $manager = User::create([
            'name' => "Manager",
            'user_name' => "manager",
            'role_status' => 1,
            'phone' => "01822222222",
            'email' => "manager@gmail.com",
            'password' => Hash::make("12345678"),
        ]);

        $managerRole = Role::firstOrCreate(['name' => 'System Admin']);
        $manager->assignRole($managerRole);
    }
}
