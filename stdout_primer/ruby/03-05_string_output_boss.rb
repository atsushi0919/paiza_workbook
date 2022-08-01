#　【文字列の出力】入力された 10 個の文字列を出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_boss

# 入出力例
INPUT1 = <<~"EOS"
  a a a a a a a a a a
EOS
OUTPUT1 = <<~"EOS"
  a
  a
  a
  a
  a
  a
  a
  a
  a
  a
EOS

# 解答例1
# 入力
ary = gets.split
# 出力
puts(ary)

# 解答例2
# 入力
ary = gets.split
# 出力
ary.each do |s|
  puts(s)
end

# 解答例3
# 入力
ary = gets.split
# 出力
0.upto(ary.length - 1) do |i|
  puts(ary[i])
end

=begin
【文字列の出力】入力された 10 個の文字列を出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_boss
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
10 個の文字列 S_1, S_2, S_3, ..., S_10 が半角スペース区切りで与えられます。
これらの文字列をすべて、改行区切りで出力してください。

入力される値
S_1 S_2 S_3 ... S_10

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの文字列を 10 行で出力してください。

S_1
S_2
S_3
...
S_10

末尾に改行を入れ、余計な文字、空行を含んではいけません。
条件
すべてのテストケースにおいて、以下の条件をみたします。

* S_i の長さは 1 以上 1,000 以下
* S_i は英小文字列

入力例1
a a a a a a a a a a

出力例1
a
a
a
a
a
a
a
a
a
a
=end
