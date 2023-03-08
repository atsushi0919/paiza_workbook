# ゾロ目 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__repdigit

INPUT1 = <<"EOS"
60
EOS

OUTPUT1 = <<"EOS"
55
EOS

# 解答例1-1
x = gets.to_i

zoro = if x >= 99
    99
  elsif x >= 88
    88
  elsif x >= 77
    77
  elsif x >= 66
    66
  elsif x >= 55
    55
  elsif x >= 44
    44
  elsif x >= 33
    33
  elsif x >= 22
    22
  elsif x >= 11
    11
  end

puts zoro

# 解答例1-2
x = gets.to_i

zoro = -1
9.downto(1) do |i|
  tmp_zoro = i * 11
  if x >= tmp_zoro
    zoro = tmp_zoro
    break
  end
end

puts zoro

# 解答例2
x = gets.chomp

if x[0] <= x[1]
  puts x[0].to_i * 11
else
  puts (x[0].to_i - 1) * 11
end

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたは大豆を x (11 ≦ x ≦ 99) 粒持っています。

あなたは大豆とゾロ目が大好きなので、大豆をなるべくたくさん、ゾロ目の粒数だけ食べたいと思っています。何粒食べられるかを求めてください。

つまり、x 以下で最大のゾロ目を求めてください。ただし、ここでゾロ目とは同じ数字が 2 つ並んだもの (11、22、33、44、55、66、77、88、99)を指します。

▼　下記解答欄にコードを記入してみよう

入力される値
x

・ 1 行目に、あなたが持っている大豆の粒の数 x が整数で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
あなたが食べることのできる大豆の粒数を求め、1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 11 ≦ x ≦ 99

入力例1
60

出力例1
55
=end
