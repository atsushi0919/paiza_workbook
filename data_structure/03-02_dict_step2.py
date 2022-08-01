def solve(input_str):
    SIZE = 26
    OFFSET = 97
    a = list(input_str.strip().split()[1:])

    result = [0] * SIZE
    for char in a:
        result[ord(char) - OFFSET] += 1

    return " ".join(map(str, result))


print(solve(open(0).read()))
