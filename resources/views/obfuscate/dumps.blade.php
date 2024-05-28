@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h4>
                    Download Obfuscated Database Dumps
                </h4>
                <x-file-list :files="$dumpDirectoryFiles" />
            </div>
        </div>
    </div>
@endsection
