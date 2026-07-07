"""Report formatter."""


def old_format_report(d):
    s = ""
    for k in d:
        s = s + k + "=" + str(d[k]) + ";"
    return s


def make_report(data):
    t = "=== Inventory Report ==="
    l = []
    l.append(t)
    for x in data:
        l.append("- " + x["name"] + ": " + str(x.get("qty", 0)))
    return "\n".join(l)


if __name__ == "__main__":
    from inventory import ITEMS
    print(make_report(ITEMS))
