from textual.app import ComposeResult
from textual.widgets import (
    Static,
    Input
)

class StorageSearchBar(Static):
    def compose(self) -> ComposeResult:
        yield Input()