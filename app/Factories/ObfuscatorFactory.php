<?php

namespace App\Factories;

class ObfuscatorFactory
{
    public const OBF_DEFAULT = 'default';
    public const OBF_IBAN = 'iban';
    public const OBF_BLZ = 'blz';
    public const OBF_BIC = 'bic';
    public const OBF_USTD = 'ustd';
    public const OBF_STRNR = 'strnr';
    public const OBF_MD5 = 'md5';
    public const OBF_EMAIL = 'email';

    /**
     * @param mixed $input
     * @param string $method
     * @return string
     */
    public static function obfuscateString($input, string $method = 'default') : string
    {
        return (new self())->getObfuscator($method)->obfuscate($input);
    }

    /**
     * @param string $method
     * @return ObfuscatorInterface
     */
    protected function getObfuscator(string $method) : ObfuscatorInterface
    {
        $obfuscators = [
            self::OBF_IBAN => IbanObfuscator::class,
            self::OBF_BLZ => BLzObfuscator::class,
            self::OBF_BIC => BicObfuscator::class,
            self::OBF_USTD => UStdObfuscator::class,
            self::OBF_STRNR => StrNrObfuscator::class,
            self::OBF_MD5 => Md5Obfuscator::class,
            self::OBF_EMAIL => EmailObfuscator::class,
            self::OBF_DEFAULT => DefaultObfuscator::class,
        ];

        return new $obfuscators[$method] ?? new (DefaultObfuscator::class);
    }
}
