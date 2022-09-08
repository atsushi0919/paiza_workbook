# 辞書順 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step2

INPUT1 = <<~"EOS"
  1
EOS
OUTPUT1 = <<~"EOS"
  aaa
EOS

INPUT2 = <<~"EOS"
  5
EOS
OUTPUT2 = <<~"EOS"
  aae
EOS

INPUT3 = <<~"EOS"
  1000
EOS
OUTPUT3 = <<~"EOS"
  bml
EOS

radix = 26
digits = STDIN.read.to_i.to_s(radix).rjust(3, "0").chars
chr_code = [97, 97, 96]
0.upto(2) do |i|
  chr_code[i] += digits[i].to_i(radix)
end

puts chr_code.map(&:chr).join

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
数値 k が与えられます。アルファベット小文字 3 文字で作れる文字列のうち、辞書順で k 番目に小さい文字列を答えてください。
辞書順とは、辞書に出てくる順番のことで、たとえばabc, aa, a, abの四つを辞書順に並び替えるとa, aa, ab, abcの順になります。

▼　下記解答欄にコードを記入してみよう

入力される値
k


・ 1 行目に、数値 k が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
アルファベット小文字 3 文字で作れる文字列のうち、辞書順で k 番目に小さい文字列を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ k ≦ 17,576 (= 26^3 )

入力例1
1

出力例1
aaa

入力例2
5

出力例2
aae

入力例3
1000

出力例3
bml
=end
