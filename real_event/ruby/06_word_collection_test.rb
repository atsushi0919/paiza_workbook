# 文字列収集 (paizaランク S 相当)
# https://paiza.jp/works/mondai/real_event/word_collection

INPUT1 = <<~"EOS"
  6 5
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
EOS
OUTPUT1 = <<~"EOS"
  5
  112
  20
  0
  200
EOS

INPUT2 = <<~"EOS"
  5 3
  paiza 16
  pizza 1
  paizaio 4
  paizapoh 2
  pizzaio 8
  paiza
  pizza
  p
EOS
OUTPUT2 = <<"EOS"
  22
  9
  31
EOS

def solve(input_str)
  # ----------------------------------------
  # 入力受け取り
  # ----------------------------------------
  # 入力文字列を改行で分割する
  input_lines = input_str.chomp.split("\n")
  # n: 単語と価格の数, m: 購入したい頭文字列の数
  n, m = input_lines.shift.split.map(&:to_i)
  # word_prices: [単語, 価格] の配列
  word_prices = input_lines.shift(n).map do |line|
    word, price = line.split
    [word, price.to_i]
  end
  # requests: 購入したい頭文字の配列
  requests = input_lines.shift(m)

  # ----------------------------------------
  # 購入希望の頭文字の購入金額を計算する
  # ----------------------------------------
  # results: 購入金額の計算結果
  results = []
  # 希望の頭文字を順に参照する
  requests.each do |request|
    # 希望の頭文字の購入金額
    total_price = 0
    # 価格が登録された単語を順に参照する
    word_prices.each do |word, price|
      # 単語の頭文字が希望の頭文字で始まるなら価格を購入金額に加算する
      total_price += price if word.start_with?(request)
    end
    # 希望の頭文字の購入金額を格納する
    results << total_price
  end

  # ----------------------------------------
  # 購入希望の頭文字の購入金額を返す
  # （改行で連結した文字列に変換して返す）
  # ----------------------------------------
  results.join("\n") << "\n"
end

puts solve(STDIN.read)

# require "./word_collection_test"
# TEST_CASE = make_problem

# puts "start"
# start = Time.now
# puts solve(TEST_CASE)
# puts Time.now - start
