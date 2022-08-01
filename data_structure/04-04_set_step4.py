def solve(input_str):
    a = list(map(int, input_str.strip().split()[1:]))

    result = []
    a_set = set([a[0]])
    for val in a[1:]:
        if val in a_set:
            result.append("Yes")
        else:
            result.append("No")
            a_set.add(val)

    return "\n".join(result)


print(solve(open(0).read()))
