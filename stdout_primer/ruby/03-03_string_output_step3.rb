#　入力された 2 つの文字列を出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_step3

# 入出力例
INPUT1 = <<~"EOS"
  paiza
  learning
EOS
OUTPUT1 = <<~"EOS"
  paiza
  learning
EOS

# 解答例
s = gets.chomp
t = gets.chomp
# 出力
puts(s)
puts(t)

=begin
入力された 2 つの文字列を出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_step3
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
2 つの文字列 S, T が入力されます。S, T を改行区切りで出力してください。

入力される値
S
T

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの文字列を 2 行で出力してください。

S
T

末尾に改行を入れ、余計な文字、空行を含んではいけません。
条件
すべてのテストケースにおいて、以下の条件をみたします。

* S, T の長さは 1 以上 10 以下
* S, T は英小文字列

入力例1
paiza
learning

出力例1
paiza
learning
=end
