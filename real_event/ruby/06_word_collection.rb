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
OUTPUT2 = <<~"EOS"
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
  # price_list: 価格表を作成する
  # ----------------------------------------
  price_list = Hash.new(0)
  word_prices.each do |word, price|
    # word の1文字目から最後まで price を登録する
    0.upto(word.length - 1) do |i|
      # 先頭から index: i までの文字を抜き出す
      key = word[..i]
      if price_list[key].nil?
        # 頭文字 key の価格が未登録なら price で新規登録
        price_list[key] = price
      else
        # 頭文字 key の価格が登録済なら price を加算
        price_list[key] += price
      end
    end
  end

  # ----------------------------------------
  # 希望単語の購入金額(購入不可なら 0)をresultsに格納する
  # ----------------------------------------
  results = requests.map { |k| price_list[k] }

  # ----------------------------------------
  # 購入希望の頭文字の購入金額を返す
  # （改行で連結した文字列に変換して返す）
  # ----------------------------------------
  results.join("\n") << "\n"
end

puts solve(STDIN.read)

# require "./word_collection_test"

# TEST_CASE = make_problem

# start = Time.now
# puts solve(TEST_CASE)
# puts Time.now - start
