n, k, *a = map(int, open(0).read().split())

print("Yes" if sum(a) <= k else "No")
