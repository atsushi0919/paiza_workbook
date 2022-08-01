def solve(input):
    max_n = -float("inf")
    min_n = float("inf")
    for n in map(int, input.strip().split()):
        max_n = max(max_n, n)
        min_n = min(min_n, n)

    return max_n - min_n


print(solve(open(0).read()))
