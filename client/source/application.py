from textual.app import App, ComposeResult
from textual.containers import Container, ScrollableContainer
from textual.reactive import reactive
from textual.widgets import(
    Header,
    Footer
)

from source.widgets import *
from source.connection import Connection

class StorageSystemApp(App):
    """ 
    A interface to manage a storage system in a minecraft server.
    """
    CSS_PATH = "../style.css"
    TITLE = "ComptuerCraft Storage System"
    BINDINGS = [
        ("ctrl+r", "reload_data", "Refresh storage system"),
        ("ctrl+d", "toggle_dark", "Toggle dark mode")
    ]

    def __init__(self, websocketAddress):
        super().__init__()
        self.websocketAddress = websocketAddress
        self.connection = Connection(websocketAddress)
        self.storageMap = StorageMap(self.connection)

    def compose(self) -> ComposeResult:
        yield Header()
        yield Footer()
        with Container(classes = "grid-container"):
            with ScrollableContainer(id = "storage-data-table-container"):
                yield StorageDataTable(id = "storage-data-table")
            with Container(classes = "storage-search-bar-container"):
                yield StorageSearchBar()

    def on_mount(self) -> None:
        table = self.query_one("#storageDataTable")
        table.cursor_type = "row"
        table.add_columns(*self.storageMap.headers[0])
        table.add_rows(self.storageMap.rows[1:])

    def action_toggle_dark(self) -> None:
        """An action to toggle dark mode."""
        self.dark = not self.dark

    def action_reload_data(self) -> None:
        table = self.query_one("#storageDataTable")
        table.add_row(*("minecraft:chest_6", 4, "minecraft:redstone", 64))

if __name__ == "__main__":
    app = StorageSystemApp()
    app.run()
