<?php

namespace App\Factories;

class BLzObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        // lax Test BLZ
        return '50010517';
    }
}
