var express = require('express');
var io = require('socket.io');

var app = express();

var server = app.listen(3000,function(){
    console.log("server listen on port 3000");
});

io.listen(server);

io.on('connection',function(socket){
    console.log('connection maded');
})