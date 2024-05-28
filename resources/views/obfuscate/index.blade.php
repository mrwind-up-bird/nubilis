@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <h4>
                    Download Obfuscated Database Dump (.sql / .tar.gz)
                </h4>
                <x-file-list :files="$outputDirectoryFiles" />
            </div>
            <div class="col-md-6">
                <h4>
                    Upload Config File (.php)
                </h4>
                <x-file-list :files="$configDirectoryFiles"
                             :runOption="true" />
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <hr>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <h4>
                    Upload Database Dump (.sql / .tar.gz)
                </h4>
                <x-file-list :files="$dumpDirectoryFiles" />
            </div>
            <div class="col-md-6">
                <h4>Output</h4>
                <div class="container-fluid border border-2 h-full w-full">
                    <pre>
                        <code data-target="command-output-stream" id="command-output-stream"></code>
                    </pre>
                </div>
            </div>
        </div>
    </div>
@endsection
