<?php

namespace App\Factories;

class IbanObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        return 'DE93578939287447200123';
    }
}
