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
                let jsonMessage = JSON.parse(messageData)
                this.storage[jsonMessage["computerID"]] = jsonMessage["storageMap"]; 
                console.log(`messageData: ${JSON.stringify(jsonMessage, null, 2)}`);
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

    messageHandler(messageData) {
        let request = JSON.parse(messageData);
        let requestMap = {
            "client": this.clientRequest,
            "storage": this.storageRequest
        }

        typeMap[request["type"]](request);
    }

    clientRequest(request) {
        return;
    }

    storageRequest(request) {
        this.storage[jsonMessage["computerID"]] = jsonMessage["storageMap"]; 
    }
    // // the following two methods are a clear violation of DRY
    // clientToStorage() {
    //     console.log(this.storageSystems.length);
    //     if (this.storageSystems.length == 0) {
    //         return;
    //     } else {
    //         this.storageSystems.forEach((client) => {
    //             client.send("response");
    //         });
    //     }
    // }

    // storageToClient() {
    //     console.log(this.storageSystems.length);
    //     if (this.storageSystems.length == 0) {
    //         return;
    //     } else {
    //         this.clients.forEach((client) => {
    //             client.send("response");
    //         });
    //     }
    // }

    // bounce(messageData) {
    //     let message = JSON.parse(messageData);
    //     let bounceMap = {
    //         "client": this.clientToStorage,
    //         "storage": this.storageToClient,
    //     };
    //     bounceMap[message["type"]]();
    // }
}

let bounceServer = new BounceServer(5454);
bounceServer.main();