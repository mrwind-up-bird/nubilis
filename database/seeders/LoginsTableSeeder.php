<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class LoginsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('demo.logins')->insert([
            ['login' => 'maxmuster', 'password' => Hash::make('password123'), 'email' => 'max@example.com', 'user_id' => 1],
            ['login' => 'erikamuster', 'password' => Hash::make('password123'), 'email' => 'erika@example.com', 'user_id' => 2],
            ['login' => 'johndoe', 'password' => Hash::make('password123'), 'email' => 'john@example.com', 'user_id' => 3],
            ['login' => 'janedoe', 'password' => Hash::make('password123'), 'email' => 'jane@example.com', 'user_id' => 4],
            ['login' => 'hansmueller', 'password' => Hash::make('password123'), 'email' => 'hans@example.com', 'user_id' => 5],
            ['login' => 'annaschmidt', 'password' => Hash::make('password123'), 'email' => 'anna@example.com', 'user_id' => 6],
            ['login' => 'peterfischer', 'password' => Hash::make('password123'), 'email' => 'peter@example.com', 'user_id' => 7],
            ['login' => 'marieweber', 'password' => Hash::make('password123'), 'email' => 'marie@example.com', 'user_id' => 8],
            ['login' => 'paulschneider', 'password' => Hash::make('password123'), 'email' => 'paul@example.com', 'user_id' => 9],
            ['login' => 'lauraneumann', 'password' => Hash::make('password123'), 'email' => 'laura@example.com', 'user_id' => 10],
            ['login' => 'michaelmeyer', 'password' => Hash::make('password123'), 'email' => 'michael@example.com', 'user_id' => 11],
            ['login' => 'sabinekoch', 'password' => Hash::make('password123'), 'email' => 'sabine@example.com', 'user_id' => 12],
            ['login' => 'klausrichter', 'password' => Hash::make('password123'), 'email' => 'klaus@example.com', 'user_id' => 13],
            ['login' => 'juliahoffmann', 'password' => Hash::make('password123'), 'email' => 'julia@example.com', 'user_id' => 14],
            ['login' => 'matthiaskrause', 'password' => Hash::make('password123'), 'email' => 'matthias@example.com', 'user_id' => 15],
            ['login' => 'lisaschulz', 'password' => Hash::make('password123'), 'email' => 'lisa@example.com', 'user_id' => 16],
            ['login' => 'thomasbecker', 'password' => Hash::make('password123'), 'email' => 'thomas@example.com', 'user_id' => 17],
            ['login' => 'ninawagner', 'password' => Hash::make('password123'), 'email' => 'nina@example.com', 'user_id' => 18],
            ['login' => 'sebastianschroeder', 'password' => Hash::make('password123'), 'email' => 'sebastian@example.com', 'user_id' => 19],
            ['login' => 'claudialange', 'password' => Hash::make('password123'), 'email' => 'claudia@example.com', 'user_id' => 20],
        ]);
    }
}
