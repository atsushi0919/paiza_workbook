# フラグ管理 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_for_step2

# [解答例1]
n = gets.to_i

flag = false
for i in 0...n
  if gets.to_i == 7
    flag = true
    break
  end
end

if flag
  puts "YES"
else
  puts "NO"
end

# [解答例2]
n = gets.to_i
ary = n.times.map { gets.to_i }
puts ary.include?(7) ? "YES" : "NO"

=begin
問題
Img 04 03 下記の問題をプログラミングしてみよう！
正整数 n と n 個の整数 a_1, ..., a_n が改行区切りで与えられるので、各 a_i (1 ≤ i ≤ n) が 7 であるか判定し、
a_1, ..., a_n の中に 7 がひとつでも含まれていた場合には "YES" を、
そうでない場合（7 がひとつも含まれていなかった場合）には "NO" を出力してください。

入力される値
入力は以下のフォーマットで与えられます。

n
a_1
...
a_n

1 行目には正整数 n が与えられ、 2 行目から (n + 1) 行目には n 個の整数 a_1, ..., a_n が改行区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a_1, ..., a_n の中に 7 がひとつでも含まれていた場合には "YES" を、そうでない場合には "NO" を出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ n および各 a_i （1 ≤ i ≤ n）は 1 以上 50 以下の整数

入力例1
2
7
1

出力例1
YES

入力例2
3
4
11
35

出力例2
NO
=end
