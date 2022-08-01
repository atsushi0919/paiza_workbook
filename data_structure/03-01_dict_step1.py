def solve(input_str):
    SIZE = 10
    a = list(map(int, input_str.strip().split()[1:]))
    result = [0] * SIZE
    for number in a:
        result[number] += 1

    return " ".join(map(str, result))


print(solve(open(0).read()))
