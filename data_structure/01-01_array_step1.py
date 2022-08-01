def solve(input):
    input_lines = input.strip().split("\n")
    (_, m), a = [list(map(int, s.split())) for s in input_lines]

    return a[m - 1]


print(solve(open(0).read()))
