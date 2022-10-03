k, *a = map(int, open(0).read().split())

res = "Yes"
total = 0
for i, e in enumerate(a):
    total += e
    if total > k:
        res = i + 1
        break

print(res)
