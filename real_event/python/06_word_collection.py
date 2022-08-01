# 文字列収集 (paizaランク S 相当)
# https://paiza.jp/works/mondai/real_event/word_collection

INPUT1 = """6 5
bcac 3
abcd 14
abccjg 92
bcaddgie 2
abcd 6
cb 200
b
a
abcd
gagioheo
cb
"""

OUTPUT1 = """5
112
20
0
200
"""

INPUT2 = """5 3
paiza 16
pizza 1
paizaio 4
paizapoh 2
pizzaio 8
paiza
pizza
p
"""

OUTPUT2 = """22
9
31
"""


def solve(input_str):
    # ----------------------------------------
    # 入力受け取り
    # ----------------------------------------
    # 入力文字列を改行で分割する
    input_lines = input_str.strip().split("\n")
    # n: 単語と価格の数, m: 購入したい頭文字列の数
    n, m = map(int, input_lines[0].split())
    # word_prices: [単語, 価格] の配列
    word_prices = []
    for line in input_lines[1:-m]:
        word, price = line.split()
        word_prices.append([word, int(price)])
    # requests: 購入したい頭文字の配列
    requests = input_lines[-m:]

    # ----------------------------------------
    # price_list: 価格表を作成する
    # ----------------------------------------
    price_list = {}
    for word, price in word_prices:
        # word の1文字目から最後まで price を登録する
        for i in range(len(word)):
            key = word[:i+1]
            price_list[key] = price_list.get(key, 0) + price

    # ----------------------------------------
    # 希望単語の購入金額(購入不可なら 0)をresultsに格納する
    # ----------------------------------------
    results = [price_list.get(key, 0) for key in requests]

    # ----------------------------------------
    # 希望単語の購入金額を返す
    # （改行で連結した文字列に変換して返す）
    # ----------------------------------------
    return "\n".join(map(str, results)) + "\n"


print(solve(open(0).read()))
