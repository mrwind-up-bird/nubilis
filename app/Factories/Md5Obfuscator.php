<?php

namespace App\Factories;

class Md5Obfuscator implements ObfuscatorInterface
{
    public function obfuscate($input) : string
    {
        return md5($input);
    }
}
