<?php

namespace App\Factories;

class StrNrObfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        return '901256234321';
    }
}
