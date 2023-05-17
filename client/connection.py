#!/usr/bin/env python

import asyncio
from websockets.sync.client import connect

class Connection:
    def __init__(self):
        pass

    def __estaablish_connection(self):
        with connect("ws://localhost:5454") as websocket:
            websocket.send("Hello world!")
            message = websocket.recv()
            print(f"Received: {message}")

class Config:
    @staticmethod
    def check_connection_config(cls):
        pass

    @staticmethod
    def create_connection_config(cls, connection):
        pass
