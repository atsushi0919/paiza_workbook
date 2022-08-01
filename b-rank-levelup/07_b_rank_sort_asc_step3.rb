# 昇順ソート出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/sort_asc_2

<<"EOS"

入力例1
8
90 777 8888 121 333 4 29 2

出力例1
2
4
29
90
121
333
777
8888

入力例2
10
10 9 8 7 6 5 4 3 2 1

出力例2
1
2
3
4
5
6
7
8
9
10

入力例3
1
3

出力例3
3

EOS

# [解答例1]
n = gets.to_i
ary = gets.split.map(&:to_i)

sorted_ary = []
ary.each do |t_n|
  inserted = false
  sorted_ary.each_with_index do |a_n, idx|
    if t_n < a_n
      sorted_ary.insert(idx, t_n)
      inserted = true
      break
    end
  end
  sorted_ary << t_n if not inserted
end
puts sorted_ary

# [解答例2]
n = gets.to_i
ary = gets.split.map(&:to_i)

puts ary.sort

=begin
昇順ソート出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/sort_asc_2
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
1行目で整数 n が与えられ、2行目で n 個の整数が与えられます。
n 個の整数を昇順に出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n
a_1 a_2 ... a_n


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a_1 から a_n の整数を昇順に並び替えて、出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ n ≦ 100
-3,000,000 ≦ a_i ≦ 3,000,000 (ただし、1 ≦ i ≦ n)

入力例1
8
90 777 8888 121 333 4 29 2

出力例1
2
4
29
90
121
333
777
8888

入力例2
10
10 9 8 7 6 5 4 3 2 1

出力例2
1
2
3
4
5
6
7
8
9
10

入力例3
1
3

出力例3
3
=end
