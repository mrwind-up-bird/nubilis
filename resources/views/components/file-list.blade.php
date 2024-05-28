<!-- resources/views/components/file-list.blade.php -->

<div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                @if (isset($runOption))
                    <th class="col-1">&nbsp;</th>
                @endif
                <th class="col-1"></th>
                <th class="col-6">File</th>
                <th class="col-1">Size</th>
                <th class="col-1">created</th>
                <th class="col-1">modified</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($files as $file)
                <tr>
                    <td>
                        <a href="/download/{{ md5($file->getFilename()) }}" download="{{ $file->getFilename() }}">
                            <button class="btn btn-sm btn-outline-info">Download</button>
                        </a>
                    </td>
                    @if (isset($runOption))
                        <td>
                            <button class="btn btn-sm btn-outline-danger" onClick="runConfig('{{ $file->getFilename() }}')">Run</button>
                        </td>
                    @endif
                    <td data-filename="{{ $file->getFilename() }}">
                        @if (md5($file->getFilename()) === md5((isset($currentFile) ?? 0)))
                            <a href="{{ route('config.load', md5($file->getFilename())) }}" class="font-weight-bold">{{ $file->getFilename() }}</a>
                        @else
                            <a href="{{ route('config.load', md5($file->getFilename())) }}">{{ $file->getFilename() }}</a>
                        @endif
                    </td>
                    <td>{{ number_format($file->getSize() / 1024 ) }} kB</td>
                    <td>{{ \Carbon\Carbon::parse($file->getCTime())->diffForHumans() }}</td>
                    <td>{{ \Carbon\Carbon::parse($file->getMTime())->diffForHumans() }}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>

    <form action="{{ route('upload') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="file" name="file" required>
        <button type="submit">Datei hochladen</button>
    </form>
</div>
<script type="text/javascript">

    function downloadFile(filename) {
        fetch(`/download/${filename}`, {
            method: 'GET'
        }).then(response => {
            console.log(response)
        });
    }

    function runConfig(filename) {
        let cleanedFile = filename.replace('config_','').replace('.php','');
        fetch(`/run/${cleanedFile}`, {
            method: 'GET'
        }).then(response => {
            response.text().then(text => {
                document.getElementById('command-output-stream').innerHTML = text;
            }).catch(error => {
                document.getElementById('command-output-stream').innerHTML = 'Error fetching Data: ' + error.message;
            })
        });
    }

</script>
