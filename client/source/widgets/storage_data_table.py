from textual.app import ComposeResult
from textual.widgets import (
    Static,
    DataTable
)

from source.storage import StorageMap

ROWS = [
    ("chest", "slot", "item", "quantity"),
    ("minecraft:chest_0", 1, "minecraft:dirt", 64),
    ("minecraft:chest_0", 20, "minecraft:dirt", 64),
    ("minecraft:chest_4", 9, "minecraft:dirt", 64),
    ("minecraft:chest_4", 11, "minecraft:dirt", 64),
    ("minecraft:chest_5", 2, "minecraft:dirt", 64),
    ("minecraft:chest_6", 4, "minecraft:redstone", 64),
]

class StorageDataTable(Static):
    """
    shows a list of items in the Storage system with a search bar at the bottom
    that allows you to search through the storage system
    """

    # def __init__(self, connection):
    #     super().__init__(self)
        # self.storageMap = StorageMap(connection)

    def compose(self) -> ComposeResult:
        yield DataTable(id = "storageDataTable")