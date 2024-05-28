<div class="container-fluid">
    <b>Actual loaded Config: {{ $currentFile }}</b>
    <form method="post" action="/config">
        @csrf
        <div class="form-group">
            <label for="config_content" class="col-md-12"></label>
                <pre>
                    <code class="php" id="config_content_code" contenteditable>
                        <textarea id="config_content" name="config_content" class="form-control" rows="40">{{ $config }}</textarea>
                    </code>
                </pre>
            <input type="hidden" name="config_filename" value="{{ $currentFile }}">
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    /**
    document.addEventListener("DOMContentLoaded", function() {
        let content = document.getElementById('config_content');
        console.log(content);
        content.addEventListener('onKeyDown', function() {
            document.querySelector('input[name="config_content"]').value = this.value;
        });

        //hljs.highlightElement(document.getElementById('config_content_code'));
    });
     **/
</script>
