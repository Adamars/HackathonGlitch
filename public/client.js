
var socket = new WebSocket('ws://localhost:8081/');
socket.onopen = function(event) {
  log('Opened connection 🎉');
  var json = JSON.stringify({ message: '0' });
  socket.send(json);
}

socket.onerror = function(event) {
  log('Error: ' + JSON.stringify(event));
}

socket.onmessage = function (event) {
  log('The value is now: ' + JSON.parse(event.data).message.toString());
}

socket.onclose = function(event) {
  log('Closed connection 😱');
}

document.querySelector('#close').addEventListener('click', function(event) {
  socket.close();
  log('Closed connection 😱');
});

document.querySelector('#sendmore').addEventListener('click', function(event) {
  var json = JSON.stringify({ message: document.getElementById('input').value, sign: '+' ,tryAdmin: 'no', password: ''});
  socket.send(json);
});

document.querySelector('#sendless').addEventListener('click', function(event) {
  var json = JSON.stringify({ message: document.getElementById('input').value, sign: '-', tryAdmin: 'no', password: '' });
  socket.send(json);
});

document.querySelector('#null').addEventListener('click', function(event) {
  var json = JSON.stringify({ message: document.getElementById('input').value, sign: '-', tryAdmin: 'yes', password: document.getElementById('password').value });
  socket.send(json);
});



//document.querySelector('#input').addEventListener('click', function(event) {
//  var json = JSON.stringify({ message: Math.floor(Math.random() * 20) });
//  socket.send(json);
//});

var log = function(text) {
  var li = document.createElement('li');
  li.innerHTML = text;
  document.getElementById('log').appendChild(li);
}

window.addEventListener('beforeunload', function() {
  socket.close();
});
