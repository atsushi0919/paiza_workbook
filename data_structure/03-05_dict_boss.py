def solve(input_str):
    input_lines = input_str.strip().split("\n")
    _, q = map(int, input_lines[0].split())
    s = input_lines[1: -q]
    t = input_lines[-q:]

    dict = {}
    for val, key in enumerate(s, 1):
        if key not in dict:
            dict[key] = val
    result = []
    for key in t:
        if key in dict:
            result.append(dict[key])
        else:
            result.append(-1)

    return "\n".join(map(str, result))


print(solve(open(0).read()))
