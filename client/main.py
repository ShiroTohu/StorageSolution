from textual.app import App, ComposeResult
from textual.containers import Container, ScrollableContainer
from textual.reactive import reactive
from textual.widgets import (
    Label, 
    Button,
    ListView,
    ListItem,
    Input,
    Footer,
    Header,
    DataTable,
    Static
)

# Example database, this is important to understanding how we will implement the
# storage solution database later :)
ROWS = [
    ("chest", "slot", "item", "quantity"),
    ("minecraft:chest_0", 1, "minecraft:dirt", 64),
    ("minecraft:chest_0", 20, "minecraft:dirt", 64),
    ("minecraft:chest_4", 9, "minecraft:dirt", 64),
    ("minecraft:chest_4", 11, "minecraft:dirt", 64),
    ("minecraft:chest_5", 2, "minecraft:dirt", 64),
    ("minecraft:chest_6", 4, "minecraft:redstone", 64),
]

CART_ROWS = [("id", "item"), (1, "dirt"), (2, "dirt"), (3, "dirt"), (4, "dirt")]

class Cart(Static):
    """
    stores the items that you want to be outputted in game
    """
    def compose(self) -> ComposeResult:
        yield DataTable(id = "shoppingCart")

    def on_mount(self) -> None:
        table = self.query_one("#shoppingCart")
        table.cursor_type = "none"
        table.add_columns(*CART_ROWS[0])
        table.add_rows(CART_ROWS[1:])


class SideBar(Static):
    def compose(self) -> ComposeResult:
        yield Cart()

class StorageSearch(Static):
    """
    The input to search for items
    """
    def compose(self) -> ComposeResult:
        yield Input()

class StorageDataTable(Static):
    """
    shows a list of items in the Storage system with a search bar at the bottom
    that allows you to search through the storage system
    """

    def compose(self) -> ComposeResult:
        yield DataTable(id = "storageDataTable")

    def on_mount(self) -> None:
        table = self.query_one(DataTable)
        table.cursor_type = "row"
        table.add_columns(*ROWS[0])
        table.add_rows(ROWS[1:])

class StorageSystemApp(App):
    """ 
    A interface to manage a storage system in a minecraft server.
    """
    CSS_PATH = "source/style.css"
    TITLE = "ComptuerCraft Storage System"
    BINDINGS = [
        ("ctrl+r", "reload_data", "Refresh storage system"),
        ("ctrl+d", "toggle_dark", "Toggle dark mode")
    ]
    
    def compose(self) -> ComposeResult:
        yield Header()
        yield Footer()
        with Container():
            yield SideBar()
        with ScrollableContainer():
            yield StorageDataTable()
        with Container():
            yield StorageSearch()
    pass

    def action_toggle_dark(self) -> None:
        """An action to toggle dark mode."""
        self.dark = not self.dark

    def action_reload_data(self) -> None:
        table = self.query_one("#storageDataTable")
        table.add_row(*("minecraft:chest_6", 4, "minecraft:redstone", 64))

if __name__ == "__main__":
    app = StorageSystemApp()
    app.run()
