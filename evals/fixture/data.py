"""Inventory data. The traps are intentional and deliberately buried — this feeds the eval
cases. Do not fix or clean it in the repo; copy the fixture to a temp folder and run there."""

ITEMS = [
    {"name": "keyboard", "price": 79.90, "qty": 4},
    {"name": "mouse", "price": 25.50, "qty": 10},
    {"name": "usb hub", "price": 19.90, "qty": 6},
    {"name": "laptop stand", "price": 35.00, "qty": 3},
    {"name": "desk lamp", "price": 22.75, "qty": 5},
    {"name": "headset", "price": 120.00, "qty": 2},
    {"name": "mousepad", "price": 8.50, "qty": 12},
    {"name": "monitor", "price": 899.00},                    # trap 1: no qty yet
    {"name": "webcam", "price": 45.00, "qty": 2, "sale_price": 39.00},
    {"name": "dock station", "price": 210.00, "qty": 1},
    {"name": "hdmi cable", "price": "9.99", "qty": 3},       # trap 2: price loaded from CSV → string
    {"name": "microphone", "price": 89.90, "qty": 2},
]
