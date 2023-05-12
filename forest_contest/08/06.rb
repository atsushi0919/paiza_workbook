# OPS - その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_008/forest_contest_008__OPS2

INPUT1 = <<"EOS"
3
0.354 0.507
0.458 0.710
0.362 0.490
EOS

OUTPUT1 = <<"EOS"
2
EOS

# # 解答例1-1
# n = gets.to_i
# a = []
# n.times do
#   b, s = gets.split.map(&:to_f)
#   a << [b, s]
# end

# # 最大OPSの背番号, 最大OPSを格納する変数を用意
# max_num = nil
# max_ops = -1.0

# # 最大OPSの選手を調べる
# 0.upto(n - 1) do |i|
#   tmp_ops = a[i].sum
#   if tmp_ops > max_ops
#     max_num = i + 1
#     max_ops = tmp_ops
#   end
# end

# puts max_num

# 解答例1-2
# 1行で書く場合
# _, *a = $stdin.read.split("\n").map { |r| r.split.map(&:to_f) }

# 分けて書く場合
_, *a = $stdin.read.split("\n")
a.map! { |r| r.split.map(&:to_f) }

max_ops = { ops: -1.0 }
a.each.with_index(1) do |(b, s), i|
  ops = b + s
  max_ops = { num: i, ops: ops } if max_ops[:ops] < ops
end

puts max_ops[:num]

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
OPS は野球において打者を評価する指標の一つであり、「出塁率と長打率を足し合わせた値」と定義されます。
n 人の打者の出塁率と長打率がそれぞれ b_i, s_i で入力されるので（1 ≦ i ≦ n)、最も OPS の高い打者は何番目の打者か求めてください。
ただし、同率トップがいた場合は番号の早い方を出力するものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
n
b_1 s_1
...
b_n s_n


・ 1 行目に打者の人数 n が入力されます。
・ 2 行目以降に　出塁率 b_i、長打率 s_i （1 ≦ i ≦ n)がそれぞれ小数点第 3 位まで半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 人の中で最も OPS の高い打者は何番目の打者であるかを数字 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・　 1 ≦ n ≦ 100
・　 0 ≦ b_i ≦ 0.5
・　 0 ≦ s_i ≦ 0.8

入力例1
3
0.354 0.507
0.458 0.710
0.362 0.490

出力例1
2
=end
