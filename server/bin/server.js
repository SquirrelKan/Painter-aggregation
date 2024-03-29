'use strict'

var debug = require('debug')('debug:server');
var app = require('../app')

app.set('port', process.env.PORT || 8090)

var server = app.listen(app.get('port'), function () {
    debug('Express server listening on port ' + server.address().port);
});