<?php

namespace Tests\Unit\Console\Commands;

use App\Console\Commands\obfuscate;
use App\Services\DatabaseService;
use Illuminate\Console\Input\Input;
use Illuminate\Console\Output\Output;
use Mockery;
use PHPUnit\Framework\TestCase;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Tester\CommandTester;

class ObfuscateTest extends TestCase
{
    private $obfuscate;

    private $inputInterface;

    private $outputInterface;

    protected function setUp(): void
    {
        parent::setUp();

        $this->inputInterface = Mockery::mock(InputInterface::class);
        $this->outputInterface = Mockery::mock(OutputInterface::class);

        $this->obfuscate = new obfuscate();
    }

    /**
     * @return void
     */
    public function testExecute()
    {
        $this->inputInterface->allows([
            'hasOption' => null,
            'getArgument' => [],
        ]);

        $this->outputInterface->expects()->write()->andReturnUsing(function ($messages) {

        });

        $databaseService = Mockery::mock(DatabaseService::class);
        $databaseService->allows(['createTargetDatabase' => $databaseService]);

        $this->obfuscate->expects('execute')->withArgs(function ($input, $output) {
            return $input instanceof InputInterface && $output instanceof OutputInterface;
        });

        app()->instance(DatabaseService::class, $databaseService);

        $commandTester = new CommandTester($this->obfuscate);

        $commandTester->execute([
            'command' => $this->obfuscate->getName(),
        ]);

        $this->assertSame(0, $commandTester->getStatusCode());
    }
}
