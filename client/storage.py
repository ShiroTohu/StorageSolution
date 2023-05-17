import asyncio
from websockets.sync.client import connect

class StorageDataTable():
    def __init__(self, connection):
        self.HEADERS = ["Chest", "Slot", "Item", "Quantity"]
        self.ROWS = []