# 文字列の逆順 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_reverse

INPUT1 = <<~"EOS"
  paiza
EOS
OUTPUT1 = <<~"EOS"
  aziap
EOS

INPUT2 = <<~"EOS"
  apple
EOS
OUTPUT2 = <<~"EOS"
  elppa
EOS

# 解答例1
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

# 解答例2
# puts gets.chomp.reverse  # reverse メソッドを使う

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__d_reverse
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
入力として文字列が与えられます。

その文字列を逆順にして出力してください。

入力される値
入力は以下のフォーマットで与えられます

s

・sは文字列


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
sを逆順にして出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ (sの長さ) ≤ 10


=end
