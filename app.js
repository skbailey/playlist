require('coffee-script');
/**
 * Module dependencies.
 */

var express = require('express'),
    http = require('http'),
    path = require('path'),
    mongoose = require('mongoose');

mongoose.connect('localhost', 'playlists');
var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

// Routes
require('./apps/home/routes')(app);
require('./apps/xhr/routes')(app);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
