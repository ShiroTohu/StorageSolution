const socket = require("ws");
var clients = [];
const webSocket = new socket.Server({port: 5454});

webSocket.on("connection", wsClient => {
    console.log("something connected");
    clients.push(wsClient);
    wsClient.send('{"command": "output", "data": {"minecraft:cobblestone": 128,"minecraft:dirt": 64}}')

    wsClient.on("message", messageData=> {
        console.log("Received message: " + messageData.toString());

        clients.forEach(function(client) {
            client.send(messageData.toString());
        });
    });

    wsClient.on("close", () => {
        console.log("something disconnected");
    })
});

console.log("started server");