<?php

namespace App\Factories;

class EmailObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        if (filter_var($input, FILTER_VALIDATE_EMAIL)) {

            if (preg_match('/@laxfarm\.(com|de|net)$/', $input)) {
                return $input;
            }

            return ObfuscatorFactory::obfuscateString($input, ObfuscatorFactory::OBF_DEFAULT);
        }

        return $input;
    }
}
