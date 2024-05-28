<?php

namespace App\Http\Controllers;

use App\Services\DatabaseService;
use App\Traits\ErrorChannelTrait;
use Carbon\Carbon;
use Dflydev\DotAccessData\Data;
use http\Exception\RuntimeException;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Number;
use Laravel\Horizon\Contracts\MasterSupervisorRepository;
use Laravel\Horizon\Horizon;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class ObfuscateController extends Controller
{
    use ErrorChannelTrait;

    private string $configFile;

    /**
     * @param Request $request
     * @param Response $response
     * @param DatabaseService $databaseService
     */
    public function __construct(private Request $request, private Response $response, private DatabaseService $databaseService, private MasterSupervisorRepository $masterSupervisorRepository)
    {
        // $this->middleware('auth');

        $this->databaseService->loadProjectConfig($this->request->get('config'));
        $this->configFile = sprintf('config_%s.php', $this->databaseService->getConfigName());
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     * @throws \RedisException
     */
    public function index()
    {
        return view('obfuscate.index')
            ->with('dumpDirectoryFiles', array_filter($this->getDirectoryContent(), function($f) {
                return !(str_starts_with($f->getFilename(), DatabaseService::OUTPUT_DUMP_PREFIX));
            }))
            ->with('outputDirectoryFiles', array_filter($this->getDirectoryContent(), function($f) {
                return (str_starts_with($f->getFilename(), DatabaseService::OUTPUT_DUMP_PREFIX));
            }))
            ->with('configDirectoryFiles', $this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_CONFIGS))
            ->with('currentFile', $this->configFile);
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     * @throws \RedisException
     */
    public function error() {
        return view('obfuscate.error')
            ->with('upsertErrorCount', $this->getErrorCount('upsert'))
            ->with('fetchErrorCount', $this->getErrorCount('fetch'))
            ->with('errorErrorCount', $this->getErrorCount('error'));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function config($config = null)
    {
        if ($this->request->isMethod('post')) {
            if ($this->request->filled('config_content')) {
                $configContent = $this->request->input('config_content');
                $configFilename = $this->request->input('config_filename');
                File::put(config_path(sprintf('%s/%s', $this->databaseService->getConfigKey(), $configFilename)),$configContent);
            }
        }

        foreach ($this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_CONFIGS) as $file) {
            if (md5($file->getFilename()) === $config) {
                $this->configFile = $file->getFilename();
            }
        }

        return view('obfuscate.config')
            ->with('config', File::get(config_path(sprintf('%s/%s', $this->databaseService->getConfigKey(), $this->configFile))))
            ->with('currentFile', $this->configFile)
            ->with('configDirectoryFiles', $this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_CONFIGS));
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     * @throws \RedisException
     */
    public function dumps()
    {

        return view('obfuscate.dumps')->with('currentFileName', false)
            ->with('dumpDirectoryFiles', array_filter($this->getDirectoryContent(), function($f) {
            return (str_starts_with($f->getFilename(), DatabaseService::OUTPUT_DUMP_PREFIX));
        }));
    }

    /**
     * @param $file
     * @return \Symfony\Component\HttpFoundation\BinaryFileResponse|void
     * @throws \RedisException
     */
    public function download($file) : BinaryFileResponse|RedirectResponse
    {
        try {
            if (isset ($this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_DUMPS)[$file])) {
                $file = $this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_DUMPS)[$file];

                if (File::exists($file->getRealPath())) {
                    return response()->download($file->getRealPath(), $file->getFilename());
                }

                else throw new RuntimeException(sprintf('File %s did not exists in given Directory %s, aborting...', $file->getFilename(), $file->getRealPath()));
            } else throw new RuntimeException(sprintf('File %s did not exists in Hashtable, aborting...', $file->getFilename()));
        }
        catch(\Exception $e) {
            $this->pushError($e);
        }

        return redirect()->back()->with('error', sprintf('Error downloading file: %s', $file));
    }


    /**
     * @return Response
     */
    public function upload() : RedirectResponse
    {
        try {
            if ($this->request->hasFile('file')) {

                $file = $this->request->file('file');
                $path = sprintf('%s/%s/', call_user_func($this->request->get('dir', DatabaseService::DIRECTORY_TYPE_DUMPS)), DatabaseService::CONFIG_KEY);

                if (!File::isDirectory($path)) {
                    File::makeDirectory($path);
                }

                $file->move($path, $file->getClientOriginalName());

                return redirect()->back()->with('success', 'File uploaded successful');
            }
        }
        catch (\Exception $e) {
            $this->pushError($e);
        }

        return redirect()->back()->with('error', sprintf('Error uploading file: %s', $file));
    }

    public function delete(string $file) : RedirectResponse
    {
        $directoryContent = $this->getDirectoryContent(DatabaseService::DIRECTORY_TYPE_DUMPS);

        try {
            if (isset($directoryContent[$file])) {

                $file = $directoryContent[$file];

                File::delete($file->getRealPath());

                return redirect()->back()->with('success', 'File uploaded successful');
            }
        }
        catch (\Exception $e) {
            $this->pushError($e);
        }

        return redirect()->back()->with('error', sprintf('Error deleting file: %s', $file->getFilename()));
    }

    /**
     * @param $dir
     * @return array
     * @throws \RedisException
     */
    private function getDirectoryContent($dir = DatabaseService::DIRECTORY_TYPE_DUMPS) : array
    {
        $dumpDirectoryFiles = [];
        try {
            array_map(function($f) use (&$dumpDirectoryFiles) {
                $dumpDirectoryFiles[md5($f->getFilename())] = $f;
            }, File::allFiles(sprintf('%s/%s/', call_user_func($dir), DatabaseService::CONFIG_KEY)));

        } catch (\Exception $e) {
            $this->pushError($e);
        }

        return $dumpDirectoryFiles;
    }
}
