<?php

namespace App\Helpers;

use App\Factories\ObfuscatorFactory;
use Illuminate\Contracts\Console\Kernel;
use Orchestra\Testbench\TestCase;

class ObfuscatorHelperTest extends TestCase
{
    protected ObfuscatorHelper $obfuscatorHelper;
    private array $config;

    public function setUp(): void
    {
        parent::setUp();
        $this->obfuscatorHelper = new ObfuscatorHelper();
        $this->config = config('obfuscate.obfuscate');
    }

    /**
     * @return mixed
     */
    public function createApplication() : mixed
    {
        $app = require __DIR__.'/../../../bootstrap/app.php';
        $app->make(Kernel::class)->bootstrap();
        return $app;
    }

    /**
     * checks wether Table is in Configuration or not
     *
     * @return void
     */
    public function testCheckIfTableToObfuscate() : void
    {
        $this->assertTrue($this->obfuscatorHelper->checkIfTableToObfuscate('tDatenuebernahme', $this->config)); // table exists
        $this->assertFalse($this->obfuscatorHelper->checkIfTableToObfuscate('tOrders', $this->config)); // not in configuration
        $this->assertTrue($this->obfuscatorHelper->checkIfTableToObfuscate('taccounthistory', $this->config)); // empty table
    }

    /**
     * @return void
     */
    public function testCheckIfFieldToObfuscate() : void
    {
        $this->assertTrue($this->obfuscatorHelper->checkIfFieldToObfuscate('tdatenuebernahme', 'cKundename')); // both exists
        $this->assertFalse($this->obfuscatorHelper->checkIfFieldToObfuscate('tdatenuebernahme', 'cNonexistentField')); // table exists, field not
        $this->assertFalse($this->obfuscatorHelper->checkIfFieldToObfuscate('nonexistentTable', 'cKundename')); // table not exists, field exists
        $this->assertTrue($this->obfuscatorHelper->checkIfFieldToObfuscate('taccount', 'cBankinstitut')); // table not exists, field exists

    }

    /**
     * @return void
     */
    public function testObfuscateString() : void
    {
        $this->assertEquals('***', ObfuscatorFactory::obfuscateString('Dr', 'default')); // less then 3 chars
        $this->assertEquals('120000089', ObfuscatorFactory::obfuscateString('123456789', 'default')); // numeric
        $this->assertEquals('+4**** *** **88', ObfuscatorFactory::obfuscateString('+49170 230 5888', 'default')); // telefonnumber
        $this->assertEquals('te**en', ObfuscatorFactory::obfuscateString('testen', 'default')); // string
        $this->assertEquals(md5('123'), ObfuscatorFactory::obfuscateString('123', 'md5'));

        // this checks for whatever it entered in the fields and is obfuscated with the methods below will be this values
        // this methods changes only the values to a test bank account and leave the structure correct.
        $this->assertEquals('PBNKDEFFXXX', ObfuscatorFactory::obfuscateString('HASPDEHH', 'bic'));
        $this->assertEquals('DE02100100100006820101', ObfuscatorFactory::obfuscateString('DE02200505501015871393', 'iban'));
        $this->assertEquals('50010517', ObfuscatorFactory::obfuscateString('18080000', 'blz'));
        $this->assertEquals('DE 999999999', ObfuscatorFactory::obfuscateString('FR 123987456', 'ustd'));
        $this->assertEquals('5133081500009', ObfuscatorFactory::obfuscateString('6177392973674', 'strnr'));
    }
}
