var fs = require('fs')

var config = {
    path: 'screenshots/',
    prefix: (new Date).toString().replace(/ /g, '_').replace(/GMT.*/, '')
};

exports.config = config;

function take (spec) {
    var name = spec.description.replace(/ /g, '_');

    browser.takeScreenshot().then(function (png) {
        var stream = fs.createWriteStream(config.path + config.prefix + name + '.png')
        stream.write(new Buffer(png, 'base64'))
        stream.end();
    });
}

exports.take = function (spec, onlyOnError) {
    if (onlyOnError && spec.results().passed()) return;
    take(spec);
};