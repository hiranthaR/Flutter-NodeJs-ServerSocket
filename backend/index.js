var express = require('express');
var socket = require('socket.io');

var app = express();

var server = app.listen(3000,function(){
    console.log("server listen on port 3000");
});

var io = socket(server);

io.on("connection", function (socket) {
    console.log('connection made');
    socket.on('sex',function(data){
        console.log(data);
    })
})