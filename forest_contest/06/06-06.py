_, *a = open(0).read().split()

score = 0
for e in a:
    if e == "correct":
        score += 2
    elif e == "incorrect":
        score -= 1

print(score)
