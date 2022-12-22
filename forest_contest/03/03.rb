# 小文字にする (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_lowercase

INPUT1 = <<~"EOS"
  pAIza
EOS
OUTPUT1 = <<~"EOS"
  paiza
EOS

INPUT2 = <<~"EOS"
  iNfORMatIon
EOS
OUTPUT2 = <<~"EOS"
  information
EOS

=begin
# 解答例1
# A: 0, B: 1, C: 2 ... X: 23, Y: 24, Z: 25
# UC = [
#   "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
#   "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
# ]
# # a: 0, b: 1, c: 2 ... x: 23, y: 24, z: 25
# LC = [
#   "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
#   "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
# ]

# ↑ と一緒

# A: 0, B: 1, C: 2 ... X: 23, Y: 24, Z: 25
UC = ("A".."Z").to_a
# # a: 0, b: 1, c: 2 ... x: 23, y: 24, z: 25
LC = ("a".."z").to_a

s = gets.chomp

s_s = ""              # 空文字列 s_s を用意
n = s.length          # s の文字数 n を取得
0.upto(n - 1) do |i|  # i を 0 から n-1 まで 1 ずつ増やしながら繰り返す
  j = UC.index(s[i])
  if j                # もし、 s[i] が UC に存在するなら（大文字なら）
    s_s <<= LC[j]     # 対応する小文字を s_s 末尾に追加
  else                # もし、 s[i] が小文字なら
    s_s <<= s[i]      # s[i] を s_s 末尾に追加
  end
end

puts s_s

# 解答例2
s = gets.chomp

s_s = ""
s.chars.each do |s_i|  # s を先頭から順に s_i で参照
  cd = s_i.ord         # s_i を文字コードに変換
  if cd <= 90          # もし、文字コードが 90 以下（大文字）なら
    cd += 32           # 文字コードに 32 を足して小文字の文字コードに変換
  end
  s_s <<= cd.chr       # 文字コードを文字に変換して s_s 末尾に追加
end

puts s_s

# 解答例3
puts gets.downcase
=end

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_lowercase
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
入力として、小文字と大文字が混在した文字列が与えられます。

これでは何が書いてあるかわかりにくいので、

この文字列に含まれる大文字を、すべて小文字に書き換えて出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

s

・sは文字列


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力された文字列sをすべて小文字に書き換えて出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ (Sの長さ) ≤ 15

入力例1
pAIza

出力例1
paiza

入力例2
iNfORMatIon

出力例2
information
=end
