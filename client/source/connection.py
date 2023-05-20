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
    def __init__(self):
        self.type = "client"
        self.inital_package = {
            "type": self.type
        } 

    def __establish_connection(self):
        with connect("ws://localhost:5454") as websocket:
            json_package = json.dumps(self.inital_package)
            websocket.send(json_package)

class Config:
    @staticmethod
    def connection_config_exists(cls):
        pass

    @staticmethod
    def test_connection(cls):
        pass

    @staticmethod
    def create_connection_config(cls, connection):
        pass

    @staticmethod
    def config_handler(cls, connection):
        cls.connection_config_exists()
        cls.test_connection()

Config.config_handler()