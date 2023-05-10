const WebSocket = require('ws');

const server = new WebSocket.Server({
    host: '10.25.239.2',
    port: 5252
});

const client = [1, 2, 3];

server.on('connection', (socket) => {
    client.push(socket);
    console.log('A client has connected');
    socket.send('{"command": "input", "data": {"cobblestone": 64}}');
    
    socket.on('message', (message) => {
        console.log(`Received message: ${message}`);
    });

    socket.on('close', () => {
        console.log("HE DISCONNECTED");
    })
});

console.log('WebSocket server is listening on ws://10.25.239.2:5252');