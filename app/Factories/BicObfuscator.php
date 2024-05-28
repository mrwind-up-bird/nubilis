<?php

namespace App\Factories;

class BicObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        // lax Test BIC
        return 'PBNKDEFFXXX';
    }
}
