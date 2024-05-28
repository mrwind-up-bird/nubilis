<?php

namespace App\Factories;
use Illuminate\Support\Str;

class DefaultObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        if (strlen($input) < 3) {
            if (is_numeric($input)) {
                return "000";
            } else {
                return "***";
            }
        } else {
            $prefix = Str::substr($input, 0, 2);
            $suffix = Str::substr($input, -2);
            $middle = Str::substr($input, 2, -2);

            $obfuscated_middle = is_numeric($input)
                ? preg_replace('/[a-zA-Z0-9]/', '0', $middle)
                : preg_replace('/[a-zA-Z0-9]/', '*', $middle);

            return $prefix . $obfuscated_middle . $suffix;
        }
    }
}
