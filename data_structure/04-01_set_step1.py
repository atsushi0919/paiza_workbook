def solve(input_str):
    _, b, *a = map(int, input_str.strip().split())

    return "Yes" if b in a else "No"


print(solve(open(0).read()))
