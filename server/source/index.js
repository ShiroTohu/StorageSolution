const socket = require("ws");

class BounceServer {
    constructor(port) {
        this.storage = {};
        this.port = port;
        this.webSocket = new socket.Server({port: this.port});
    }

    main() {
        webSocket.on("connection", wsClient => {
            console.log("something connected");
            // wsClient.send('{"command": "output", "data": {"minecraft:cobblestone": 128,"minecraft:dirt": 64}}');
        
            wsClient.on("message", messageData=> {
                this.messageHandler(wsClient, messageData)
            });
        
            wsClient.on("close", () => {
                console.log("something disconnected");

                // Some useful code that I might need later lmao
                // const index = this.storageSystems.indexOf(wsClient);
                // if (index !== -1) {
                //     this.storageSystems.splice(index, 1);
                // }
            })
        });

        console.log("started server");
    }

    messageHandler(wsClinet, messageData) {
        let request = JSON.parse(messageData);
        let requestMap = {
            "client": this.clientRequest,
            "storage": this.storageRequest
        }

        requestMap[request["type"]](wsClient, request);
    }

    clientRequest(wsClient, request) {
        wsClient.send(JSON.stringify(this.storage));
    }

    storageRequest(wsClient, request) {
        this.storage[request["computerID"]] = request["storageMap"]; 
    }
}

let bounceServer = new BounceServer(5454);
bounceServer.main();