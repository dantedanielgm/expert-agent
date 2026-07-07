"""Tiny inventory tool. Used by the eval cases — the data (and its traps) lives in data.py.
Do not fix or clean this in the repo; copy the fixture to a temp folder and run the evals there."""

from data import ITEMS


def total_value(items):
    """Total inventory value: sum of price * qty."""
    total = 0
    for it in items:
        total += it["price"] * it["qty"]
    return total


if __name__ == "__main__":
    print(f"Total inventory value: {total_value(ITEMS)}")
