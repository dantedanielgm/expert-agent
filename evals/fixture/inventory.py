"""Tiny inventory tool."""

from data import ITEMS


def total_value(items):
    """Total inventory value: sum of price * qty."""
    total = 0
    for it in items:
        total += it["price"] * it["qty"]
    return total


if __name__ == "__main__":
    print(f"Total inventory value: {total_value(ITEMS)}")
