def solve(input):
    input_lines = input.strip().split("\n")
    _, a, *q = [list(map(int, s.split())) for s in input_lines]

    result = []
    for query in q:
        if query[0] == 0:
            # push_back x
            a.append(query[1])
        elif query[0] == 1:
            # pop_back
            a.pop()
        else:
            # print
            result.append(" ".join(map(str, a)))

    return "\n".join(result)


print(solve(open(0).read()))
