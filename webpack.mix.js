let mix = require('laravel-mix');

mix.js('./assets/js/index.js', 'js/app.js')
    .sass('./assets/css/app.scss', 'css/style.css')
    .setPublicPath('./public/build')
    .options({
        processCssUrls: false
    })
    .vue();