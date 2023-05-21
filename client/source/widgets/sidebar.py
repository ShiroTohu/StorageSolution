from textual.app import ComposeResult
from textual.widgets import (
    Static,
    DataTable
)

CART_ROWS = [("quantity", "item"), (1, "dirt"), (2, "dirt"), (3, "dirt"), (4, "dirt")]

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