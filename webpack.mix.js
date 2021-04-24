let mix = require('laravel-mix');

mix.options({processCssUrls: false})
    .js('./assets/js/index.js', 'js/app.js')
    .sass('./assets/css/app.scss', 'css/style.css')
    .setPublicPath('./public/build')
    .webpackConfig({resolve: {
            alias: {
                'BASE': __dirname + '/assets/js/',
                'COMPONENTS': __dirname + '/assets/js/components/'
            }
        }
    })
    .vue();
