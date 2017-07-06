var express = require("express");
var app = express();
var mysql = require("mysql");
var http = require('http')
var path = __dirname + '/index2.html';
var server = http.createServer(app);
var session = require('express-session');
var io = require('socket.io').listen(server);
var bodyParser = require('body-parser');
var songPath;
var allSongsInChannelOne;
var allSongsInChannelTwo
var currentSong;
var user_arr = new Array();
var no_of_users;
var requested_user;
var user_channel = {};
var clients_in_the_room
app.use(bodyParser.urlencoded({ extended: true }));

// First you need to create a connection to the db
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "aig<344",
  database: "Db"
});
app.use(express.static('./Public'));
app.use(session({secret: 'ssshhhhh'}))
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
var sess;
app.get('/', function(req, res) {
  res.redirect('login.html');
});

app.post('/', function(req, res) {
  sess = req.session;
  sess.name = req.body.name;
  var name = sess.name;
  //no_of_users = user_arr.push(sess.name);
  user_channel[name] = 0;
  console.log(user_channel);
  res.render('index_temp', {name:sess.name});
 // res.json({name:sess.name});
});

con.connect(function(err){
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
  sql = "SELECT path FROM ChannelOne";
  con.query(sql, function (err, result) {
    if (err) throw err;
    //console.log(result);
    allSongsInChannelOne = result;
  });
  sql = "SELECT path FROM ChannelTwo";
  con.query(sql, function (err, result) {
    if (err) throw err;
    //console.log(result);
    allSongsInChannelTwo = result;
  });

  con.end(function(err) {
});
});

/*app.get('/channel', function(req, res) {
	console.log("in channel1");
	return res.redirect('/hello.html');
});*/

io.on('connection', function (socket) {
  console.log("user connected");
   socket.on('room', function(room) {
        socket.join(room);
        if(room == 1) {
          io.sockets.in(room).emit('displayPlaylistOne', {list:allSongsInChannelOne, number:'One'});
        }
        else if(room == 2) {
          io.sockets.in(room).emit('displayPlaylistTwo', {list:allSongsInChannelTwo, number:'Two'});
        }

    });
  socket.on('channel', function(data) {
    requested_user = data.name;
    console.log(data.name + " was in channel "+ user_channel[data.name]);
    var x = user_channel[data.name];
    user_channel[data.name] = data.channelNumber;
    if(x > 0 && x != data.channelNumber) {
      socket.leave(x);
      //user_channel[data.name] = data.channelNumber;
      console.log(data.name + " left " + x);
    }
    socket.join(user_channel[data.name]);
    clients_in_the_room = io.sockets.adapter.rooms['1']; 
    console.log(clients_in_the_room);
    console.log(data.name + " is in channel "+data.channelNumber);
    io.sockets.in(data.channelNumber).emit('xx', data.channelNumber);
  });
  socket.on('x', function(data) {
    io.sockets.in(requested_user).emit('firstSong', {startTime:data.t, path:data.path});
  })
  socket.on('sendToServerOne', function(data) {
    clients_in_the_room = io.sockets.adapter.rooms['1']; 
    console.log(clients_in_the_room);
    currentSong = data;
    io.sockets.in('1').emit('nextSong', {path:currentSong});
  })
  socket.on('sendToServerTwo', function(data) {
    currentSong = data;
    io.sockets.in('2').emit('nextSong', {path:currentSong});
  })
  socket.on('sendToServerOne', function(data) {
    currentSong = data;
    io.sockets.in('3').emit('nextSong', {path:currentSong});
  })
});



/*var server = app.listen(3000, function() {
	console.log("Server is running");
});*/

server.listen(3000);