import asyncio
from websockets.sync.client import connect
import json

class StorageMap():
    def __init__(self, connection):
        self.connection = connection
        self.storageMap = self.fetch() 
        self.__set_table()

    def __send_request(self, package):
        with connect(f"ws://{self.connection.address}") as websocket:
            json_package = json.dumps(package)
            websocket.send(json_package)
            response = websocket.recv()
            return response
        
    def __set_table_headers(self):
        self.headers = [("Chest", "Item", "Quantity")]

    def __set_table_rows(self):
        self.rows = []
        inner_json_string = self.storageMap["0"]
        inner_json = json.loads(inner_json_string)
        print(json.dumps(inner_json["minecraft:chest_9"], indent = 4))
        for computerID in self.storageMap:
            storage = json.loads(self.storageMap["0"])
            for chest in storage.keys():
                for item in storage[chest]:
                    self.rows.append((chest, item["name"], item["count"]))


    def __set_table(self):
        self.__set_table_headers()
        self.__set_table_rows()

    def input(self):
        pass

    def output(self):
        pass

    def fetch(self):
        response = self.__send_request(self.connection.inital_package)
        storageMap = json.loads(response)
        return storageMap