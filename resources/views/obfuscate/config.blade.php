@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <h4>
                    Configuration
                </h4>
                <p>
                    <x-config-detail :config="$config"
                                     :currentFile="$currentFile"/>
                </p>
            </div>
            <div class="col-md-4">
                <h4>
                    Load Configuration File
                </h4>
                <p id="config-file-list">
                    <x-file-list :files="$configDirectoryFiles"
                                 :currentFile="$currentFile"
                                 :runOption="true"/>
                </p>
            </div>
        </div>
    </div>
@endsection


<script type="text/javascript">



</script>
