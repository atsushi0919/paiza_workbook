def solve(input_str):
    a = input_str.strip().split()[1:]

    result = {}
    for key in a:
        if key in dict:
            result[key] += 1
        else:
            result[key] = 1

    return "\n".join([f"{k} {v}" for (k, v) in sorted(result.items())])


print(solve(open(0).read()))
