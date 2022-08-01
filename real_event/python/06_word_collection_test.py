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
    # 購入希望の頭文字の購入金額を計算する
    # ----------------------------------------
    # results: 購入金額の計算結果
    results = []
    # 希望の頭文字を順に参照する
    for request in requests:
        # 希望の頭文字の購入金額
        total_price = 0
        # 価格が登録された単語を順に参照する
        for word, price in word_prices:
            # 単語の頭文字が希望の頭文字で始まるなら価格を購入金額に加算する
            if word.startswith(request):
                total_price += price
        # 希望の頭文字の購入金額を格納する
        results.append(total_price)

    # ----------------------------------------
    # 希望単語の購入金額を返す
    # （改行で連結した文字列に変換して返す）
    # ----------------------------------------
    return "\n".join(map(str, results)) + "\n"


print(solve(open(0).read()))
