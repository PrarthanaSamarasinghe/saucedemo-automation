def prices_to_numbers(prices):
    """Turn ['$29.99', '$9.99'] into [29.99, 9.99]."""
    return [float(price.replace("$", "")) for price in prices]


def should_be_sorted(items, order="asc"):
    """Fail the test if the list is not sorted (asc = small to big, desc = big to small)."""
    expected = sorted(items, reverse=(order == "desc"))
    if items != expected:
        raise AssertionError(
            f"List is not sorted ({order}).\nActual:   {items}\nExpected: {expected}"
        )
