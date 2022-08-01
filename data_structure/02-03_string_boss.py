def solve(input):
    input_lines = input.strip().split("\n")
    _, _, r, c = map(int, input_lines[0].split())
    s = [list(line) for line in input_lines[1:]]

    return "Yes" if s[r - 1][c - 1] == "#" else "No"


print(solve(open(0).read()))
