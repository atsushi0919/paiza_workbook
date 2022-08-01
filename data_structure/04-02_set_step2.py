def solve(input_str):
    a = set(map(int, input_str.strip().split()[1:]))

    return " ".join(map(str, a))


print(solve(open(0).read()))
