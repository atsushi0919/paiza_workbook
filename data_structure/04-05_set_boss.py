def solve(input_str):
    a_set, b_set = [
        set(map(int, s.split()))
        for s in input_str.strip().split("\n")[1:]]

    return " ".join(map(str, sorted(a_set | b_set)))


print(solve(open(0).read()))
