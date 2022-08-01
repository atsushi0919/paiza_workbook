# 3 * 3 の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step2

# 入出力例
INPUT1 = <<~"EOS"
  0 1 2 3 4 5 6 7 8
EOS
OUTPUT1 = <<~"EOS"
  0 1 2
  3 4 5
  6 7 8
EOS

# 解答例1
w = 3
# 入力
ary = gets.split.map(&:to_i)
# ary の先頭から順に参照する
row = []
ary.each do |n|
  # ary の先頭から要素を取り出して row に追加する
  row.push(n)
  # 要素数 w=3 個毎に matrix に row を出力し row を空にする
  if row.length == w
    puts(row.join(" "))
    row = []
  end
end

# 解答例2
w = 3
# 入力
ary = gets.split.map(&:to_i)
# 3 x 3 の行列を作成
matrix = []
row = []
# ary の先頭から順に参照する
ary.each do |n|
  # n を row に追加する
  row.push(n)
  # 要素数 w=3 個毎に row を matrix に追加し row を空にする
  if row.length == w
    matrix.push(row)
    row = []
  end
end
# 出力
puts(matrix.map { |row| row.join(" ") })
