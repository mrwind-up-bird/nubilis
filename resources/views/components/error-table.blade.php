@props(['errors'])

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <tr>
            <th class="col-2">ErrorCode</th>
            <th class="col-2">ErrorCount</th>
            <th class="col">ErrorMessage</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($errors as $error)
            <tr>
                <td>{{ $error['errorCode'] }}</td>
                <td>{{ $error['errorCount'] }}</td>
                <td>
                    <div class="error-message" style="max-width: 400px; overflow: hidden; text-overflow: ellipsis;">
                        {{ $error['errorMessage'] }}
                        @if (strlen($error['errorMessage']) > 100)
                            <a href="#" class="expand-message">Mehr anzeigen</a>
                        @endif
                    </div>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

