# 文字列の逆順 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_reverse

INPUT1 = <<"EOS"
paiza
EOS
OUTPUT1 = <<"EOS"
aziap
EOS

INPUT2 = <<"EOS"
apple
EOS
OUTPUT2 = <<"EOS"
elppa
EOS

# ruby 解答例1
# 入力
s = gets.chomp

# s の文字数 n を取得
n = s.length
# 空文字列 r_s を用意
r_s = ""
# i を n-1 から 0 まで 1 ずつ減らしながら繰り返す
(n - 1).downto(0) do |i|
  # s[i] を r_s 末尾に追加
  r_s <<= s[i]
end

# 出力
puts r_s

# ruby 解答例2
puts gets.chomp.reverse
