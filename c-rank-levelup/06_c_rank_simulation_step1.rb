# 条件を満たす最小の自然数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_simulation_step1

# [解答例1]
num = 10000
div = 13

while num % div != 0
  num += 1
end

puts num

# [解答例1]
num = 10000
div = 13

puts num + (div - (num % div))

=begin

10000 以上かつ 13 で割り切れるような最小の自然数を求めてください。

入力される値
なし


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えを 1 行で出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
なし
=end
