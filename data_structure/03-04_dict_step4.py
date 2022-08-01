def solve(input_str):
    input_lines = input_str.strip().split("\n")
    _, m = map(int, input_lines[0].split())
    a = input_lines[1: -m]
    s = input_lines[-m:]

    dict = {}
    for line in a:
        key, value = line.split()
        dict[key] = int(value)
    result = []
    for key in s:
        if key in dict:
            result.append(dict[key])
        else:
            result.append(-1)

    return "\n".join(map(str, result))


print(solve(open(0).read()))
