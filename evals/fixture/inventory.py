"""Tiny inventory tool. The traps are intentional — this file feeds the eval cases.
Do not fix or clean it in the repo; copy it to a temp folder and run the evals there."""

ITEMS = [
    {"name": "keyboard", "price": 79.90, "qty": 4},
    {"name": "mouse", "price": 25.50, "qty": 10},
    {"name": "monitor", "price": 899.00},                    # trap 1: no qty yet
    {"name": "hdmi cable", "price": "9.99", "qty": 3},       # trap 2: price loaded from CSV → string
    {"name": "webcam", "price": 45.00, "qty": 2, "sale_price": 39.00},
]


def total_value(items):
    """Total inventory value: sum of price * qty."""
    total = 0
    for it in items:
        total += it["price"] * it["qty"]
    return total


if __name__ == "__main__":
    print(f"Total inventory value: {total_value(ITEMS)}")
