@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <h2>
                    Error Channel Application
                </h2>
                <p>
                    <x-error-table :errors="$errorErrorCount" />
                </p>
            </div>
            <div class="col-md-4">
                <h2>
                    Error Channel Fetch
                </h2>
                <p>
                    <x-error-table :errors="$fetchErrorCount" />
                </p>
            </div>
            <div class="col-md-4">
                <h2>
                    Error Channel Upsert
                </h2>
                <p>
                    <x-error-table :errors="$upsertErrorCount" />
                </p>
            </div>
        </div>
    </div>
@endsection
