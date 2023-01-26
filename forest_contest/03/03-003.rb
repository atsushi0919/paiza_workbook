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

# 解答例1
# 大文字と小文字の対応のハッシュを用意する
# ALPHABET = {
#   "A" => "a", "B" => "b", "C" => "c", "D" => "d", "E" => "e", "F" => "f",
#   "G" => "g", "H" => "h", "I" => "i", "J" => "j", "K" => "k", "L" => "l",
#   "M" => "m", "N" => "n", "O" => "o", "P" => "p", "Q" => "q", "R" => "r",
#   "S" => "s", "T" => "t", "U" => "u", "V" => "v", "W" => "w", "X" => "x",
#   "Y" => "y", "Z" => "z",
# }

# こう書いても同じ
ALPHABET = ("A".."Z").zip("a".."z").to_h

s = gets.chomp

# l_s = ""               # 空文字列 l_s を用意
# s.chars.each do |s_i|  # s を 先頭から順に s_i で参照
#   l_c = ALPHABET[s_i]  # s_i が大文字なら小文字、 s_i が小文字なら nil を l_c に代入
#   if l_c
#     l_s <<= l_c        # s_i の小文字を l_s に追加
#   else
#     l_s <<= s_i        # s_i を l_s に追加
#   end
# end

# 上記を短くまとめると
l_s = ""
s.chars.each { |s_i| l_s <<= ALPHABET[s_i] || s_i }

puts l_s

# ASCII コード
# A: 65, B: 66, C: 67, D: 68, ... W: 87, X: 88, Y: 89, Z: 90
# a: 97, b: 98, c: 99, d: 100, ... w: 119, x: 120, y: 121, z: 122

=begin
# 解答例2
s = gets.chomp

# 空文字列 l_s を用意
l_s = ""
# s を先頭から順に s_i で参照
s.chars.each do |s_i|
  # s_i を文字コードに変換
  cd = s_i.ord
  # もし、大文字なら小文字の文字コードに変換
  cd += 32 if cd <= 90
  # 文字コードを文字に変換して l_s に追加
  l_s <<= cd.chr
end

puts l_s

# 解答例3
# puts gets.downcase
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
