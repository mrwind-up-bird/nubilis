<?php

namespace App\Services;

use Illuminate\Contracts\Console\Kernel;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use App\Entities\TableEntity;
use Orchestra\Testbench\TestCase;

class DatabaseServiceTest extends TestCase
{
    /**
     * @return void
     */
    public function setUp(): void
    {
        parent::setUp();
        $this->config = config('database');
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
     * @return void
     */
    public function testSetTable() : void
    {
        $databaseService = new DatabaseService();
        $databaseService->setTable('test_table');

        $this->assertEquals('test_table', $databaseService->getTable());
    }

    /**
     * @return void
     */
    public function testCreateTableIfNotExists() : void
    {
        $tableEntity = new TableEntity([
            'tableName' => 'test_table',
            'createTableStmt' => 'CREATE TABLE IF NOT EXISTS test_table (id INT PRIMARY KEY, name VARCHAR(255))',
        ]);

        $databaseService = new DatabaseService();
        $affectedRows = $databaseService->createTableIfNotExists($tableEntity);

        $this->assertTrue($affectedRows > 0);
    }

    /**
     * @return void
     */
    public function testFetchContent() : void
    {
        DB::shouldReceive('connection')->andReturnSelf();
        DB::shouldReceive('table->paginate')->andReturn(collect(['data' => [], 'current_page' => 1, 'per_page' => 10, 'total' => 0]));

        $databaseService = new DatabaseService();
        $databaseService->setTable('taccount');

        $content = $databaseService->fetchContent();

        $this->assertInstanceOf(LengthAwarePaginator::class, $content);
    }
}
