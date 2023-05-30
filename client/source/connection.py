#!/usr/bin/env python

import asyncio
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
        self.address = address
        self.type = "client"
        self.inital_package = {
            "type": self.type
        }