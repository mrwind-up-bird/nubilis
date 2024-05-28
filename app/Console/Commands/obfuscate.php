<?php

namespace App\Console\Commands;

use App\Jobs\TableRunnerJob;
use App\Jobs\WatcherJob;
use App\Services\DatabaseService;
use App\Traits\DatabaseTransactionTrait;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Str;
use Laravel\Horizon\Horizon;
use Symfony\Component\Console\Command\Command AS CommandAlias;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

/**
 * Command for obfuscation for Table Fields
 */
class obfuscate extends Command
{
    use DatabaseTransactionTrait;

    protected $signature = 'obfuscate:run';
    protected $description = 'Obfuscates Table Fields with sensitive Data for internal use';
    public const DEFAULT_QUEUENAME = 'default_obfuscator';
    private SymfonyStyle $io;
    private int $dryRun;
    public const int MAX_QUEUES = 1;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return void
     */
    protected function initialize(InputInterface $input, OutputInterface $output) : void
    {
        parent::initialize($input, $output);
        $this->dryRun = $input->hasOption('dryRun') ?? DatabaseService::setDryRunMode();
    }

    /**
     * @return void
     */
    public function configure() : void
    {
        $this->setName('app:obfuscate')
            ->setDescription('Obfuscates Table Fields with sensitive Data for internal use')
            ->addOption('table', 't', InputOption::VALUE_OPTIONAL)
            ->addOption('worker', 'w', InputOption::VALUE_OPTIONAL)
            ->addOption('config', 'c', InputOption::VALUE_OPTIONAL)
            ->addOption('dryRun', 'd', InputOption::VALUE_OPTIONAL);
    }

    /**
     * Execute the console command.
     *
     * @throws \Throwable
     */
    public function execute(InputInterface $input, OutputInterface $output) : int
    {
        $databaseService = (new DatabaseService())->loadProjectConfig($this->option('config') ?? null)->createTargetDatabase();

        $this->io = new SymfonyStyle($input, $output);
        $this->io->info(sprintf('Start Obfuscate %s with Config: %s', $databaseService->getTargetDbName(), $databaseService->getConfigName()));

        $table = !empty($this->option('table')) ? Str::of($this->option('table'))->explode(',') : null;

        try {
            $jobs = [];

            $cluster = $databaseService->clusterTables(self::MAX_QUEUES, $table);

            foreach ($cluster as $clusterTables) {
                foreach ($clusterTables as $table) {
                    $jobs[] = new TableRunnerJob($table);
                }
            }

            $this->io->info(sprintf('%s Jobs for processing Tables created, creating Batch for %s', count($jobs), self::DEFAULT_QUEUENAME));

            $batch = Bus::batch($jobs)->onQueue(self::DEFAULT_QUEUENAME)->dispatch();
            $this->io->info(sprintf('Batch with ID: %s created', $batch->id));
            Log::info(sprintf('Batch with ID: %s created', $batch->id));

            Queue::later(Carbon::now()->addSeconds(10), new WatcherJob($batch->id, $databaseService), '', WatcherJob::WATCHER_QUEUE_NAME);
            $this->io->info(sprintf('Watcher for Batch ID: %s created', $batch->id));

            return CommandAlias::SUCCESS;

        } catch (\Throwable $e) {
            Log::error(sprintf('Error: %s, StackTrace: %s', $e->getMessage(), $e->getTraceAsString()));
            $this->io->error(sprintf('Error: %s', $e->getMessage()));

            return CommandAlias::FAILURE;
        }
    }
}
