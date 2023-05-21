#!/usr/bin/env python

import asyncio
import json
from websockets.sync.client import connect

class Connection:
    """
    The `Connection` class establishes a connection to the websocket server

    ...

    Attributes
    ----------
    type: str
        when connecting to the webserver the type is used to differentiate
        whether the client connecting is a storage system or client. Therefore,
        the server can send out different different information depending on
        what "type" the connection is
    """
    # when connecting to the webserver the type is used
    def __init__(self, address):
        self.address
        self.type = "client"
        self.inital_package = {
            "type": self.type
        } 

    def __send_request(self, package):
        with connect(f"ws://{self.address}") as websocket:
            json_package = json.dumps(self.package)
            websocket.send(json_package)
            response = websocket.recv()
            return

    def input(self):
        pass

    def output(self):
        pass

    def getStorageMap(self):
        self.__establish_connection()