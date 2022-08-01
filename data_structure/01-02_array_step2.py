def solve(input):
    input_lines = input.strip().split("\n")
    _, a, _, b = [list(map(int, s.split())) for s in input_lines]

    return "\n".join([str(a[i - 1]) for i in b])


print(solve(open(0).read()))
