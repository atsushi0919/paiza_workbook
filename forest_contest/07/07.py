# 三冠王 (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__triple_crown

INPUT1 = """\
3
0.318 134 56
0.314 20 1
0.252 82 30"""
OUTPUT1 = "Triple"

INPUT2 = """\
3
0.276 134 56
0.314 20 1
0.252 82 30"""
OUTPUT2 = "Double"

INPUT3 = """\
3
0.276 92 32
0.314 20 1
0.252 82 34"""
OUTPUT3 = "Nobody"

# # 解答例1
# n = int(input())
# q = [input() for _ in range(n)]

# # 打率, 打点, ホームラン それぞれトップの選手を記録
# daritsu = [-1, []]  # Top打率と該当選手No
# daten = [-1, []]    # Top打点と該当選手No
# homerun = [-1, []]  # TopHR数と該当選手No
# for i, record in enumerate(q):
#     b_i, r_i, h_i = record.split()
#     b_i = float(b_i)
#     r_i = int(r_i)
#     h_i = int(h_i)

#     if b_i > daritsu[0]:
#         daritsu[0] = b_i
#         daritsu[1] = [i]
#     elif b_i == daritsu[0]:
#         daritsu[1].append(i)
#     if r_i > daten[0]:
#         daten[0] = r_i
#         daten[1] = [i]
#     elif r_i == daten[0]:
#         daten[1].append(i)
#     if h_i > homerun[0]:
#         homerun[0] = h_i
#         homerun[1] = [i]
#     elif h_i == homerun[0]:
#         homerun[1].append(i)

# # 各選手が何冠しているか集計
# p_results = [0] * n
# for i in daritsu[1] + daten[1] + homerun[1]:
#     p_results[i] += 1

# # Top選手は何冠しているか？
# crowns = max(p_results)
# if crowns == 3:
#     print("Triple")
# elif crowns == 2:
#     print("Double")
# else:
#     print("Nobody")


# # 解答例2-1
# n = int(input())
# q = [input() for _ in range(n)]

# # 打率, 打点, ホームランの順位表作成
# daritsu_records = {}
# daten_records = {}
# homerun_records = {}
# for i, record in enumerate(q):
#     b_i, r_i, h_i = record.split()
#     b_i = float(b_i)
#     r_i = int(r_i)
#     h_i = int(h_i)
#     daritsu_records[b_i] = daritsu_records.get(b_i, []) + [i]
#     daten_records[r_i] = daten_records.get(r_i, []) + [i]
#     homerun_records[h_i] = homerun_records.get(h_i, []) + [i]

# daritsu_records = sorted(daritsu_records.items(), reverse=True)
# daten_records = sorted(daten_records.items(), reverse=True)
# homerun_records = sorted(homerun_records.items(), reverse=True)

# # 打率, 打点, ホームランそれぞれの首位選手を記録
# p_results = [0] * n
# for i in daritsu_records[0][1] + daten_records[0][1] + homerun_records[0][1]:
#     p_results[i] += 1

# # Top選手は何冠しているか？
# crowns = max(p_results)
# if crowns == 3:
#     print("Triple")
# elif crowns == 2:
#     print("Double")
# else:
#     print("Nobody")


# 解答例2-2
n, *q = open(0).read().strip().split("\n")
n = int(n)

# 打率, 打点, ホームランの順位表作成
records = [{} for _ in range(3)]
for i, record in enumerate(q):
    b_i, r_i, h_i = record.split()
    b_i = float(b_i)
    r_i = int(r_i)
    h_i = int(h_i)
    records[0][b_i] = records[0].get(b_i, []) + [i]
    records[1][r_i] = records[1].get(r_i, []) + [i]
    records[2][h_i] = records[2].get(h_i, []) + [i]

# 打率, 打点, ホームランそれぞれの首位選手を記録
p_results = [0] * n
for record in records:
    for i in sorted(record.items())[-1][-1]:
        p_results[i] += 1
# [sorted(record.items())[-1][-1] for record in records]

# Top選手は何冠しているか？
crowns = max(p_results)
if crowns ==3:
    print("Triple")
elif crowns == 2:
    print("Double")
else:
    print("Nobody")


'''
野球における三冠王は、打者の場合、「1 人の打者が、1. 打率、2. 打点、3. 本塁打の 3 つ全ての指標において大きい順で一位を獲得すること」
と定義されます。また、3 つの指標のうち 2 つの指標において一位の打者は「二冠王」と定義します。
n 人の打者の打率、打点、本塁打がそれぞれ b_i, r_i, h_i で与えられるので（1 ≦ i ≦ n)、三冠王または二冠王がいるかどうかを判定してください。
ただし、各指標において一位が複数人いる場合もあります。

▼　下記解答欄にコードを記入してみよう

入力される値
n
b_1 r_1 h_1
...
b_n r_n h_n


・ 1 行目に打者の人数 n が入力されます。
・ 2 行目以降に打者 i の打率 b_i が小数第 3 位までの小数で、打点 r_i、本塁打 h_i（1 ≦ i ≦ n)がそれぞれ整数として半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
三冠王がいる場合は「Triple」、三冠王がいないかつ二冠王がいる場合は「Double」、三冠王も二冠王もいない場合は「Nobody」と 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 2 ≦ n ≦ 100
・ 0 ≦ b_i ≦ 0.389
・ 0 ≦ r_i ≦ 161
・ 0 ≦ h_i ≦ 61

入力例1
3
0.318 134 56
0.314 20 1
0.252 82 30

出力例1
Triple

入力例2
3
0.276 134 56
0.314 20 1
0.252 82 30

出力例2
Double

入力例3
3
0.276 92 32
0.314 20 1
0.252 82 34

出力例3
Nobody
'''
