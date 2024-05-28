<?php

namespace App\Factories;

class UStdObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        return 'DE999999999';
    }
}
