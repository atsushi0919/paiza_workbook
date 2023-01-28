# 英単語の生成（連結） (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_join

INPUT1 = <<"EOS"
play ing
EOS
OUTPUT1 = <<"EOS"
playing
EOS

INPUT2 = <<"EOS"
un balance
EOS
OUTPUT2 = <<"EOS"
unbalance
EOS

# ruby 解答例1
# 入力
s = gets.split

# 空文字列 w を用意
w = ""
# s の文字数 n を取得
n = s.length
# i を 0 から n-1 まで 1 ずつ増やしながら繰り返す
0.upto(n - 1) do |i|
  # もし、s[i] が 半角スペース以外なら
  if s[i] != " "
    # s[i] を w 末尾に追加
    w <<= s[i]
  end
end

# 出力
puts w

# ruby 解答例2
s1, s2 = gets.split
puts s1 + s2

# ruby 解答例3
puts gets.split.join

# ruby 解答例4
puts gets.gsub(" ", "")
