const mix = require('laravel-mix');

mix.js('resources/js/app.js', 'public/js')
    .js('resources/js/bootstrap.js', 'public/js')
    .js('resources/js/jquery.min.js', 'public/js')
    .js('resources/js/popper.min.js', 'public/js')
    .js('resources/js/scripts.js', 'public/js')
    .sass('resources/css/app.css', 'public/css')
    .sass('resources/css/bootstrap.css', 'public/css')
    .sass('resources/css/bootstrap-grid.css', 'public/css')
    .sass('resources/css/bootstrap-reboot.css', 'public/css')
