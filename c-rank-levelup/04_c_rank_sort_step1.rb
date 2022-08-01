# 昇順ソート (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_sort_step1

=begin
# O(n log n)
n = gets.to_i
ary = n.times.map { gets.to_i }.sort
puts ary

n = 300000
start = Time.now
ary = []
n.times { ary << rand(10000) }
ary.sort!
puts Time.now - start
=end

n = gets.to_i

ary = []
n.times do
  t_n = gets.to_i
  inserted = false
  ary.each_with_index do |a_n, idx|
    if t_n < a_n
      ary.insert(idx, t_n)
      inserted = true
      break
    end
  end
  ary << t_n if not inserted
end
puts ary

=begin
問題
n 個の数 a_1, … , a_n が与えられます。与えられた数を小さい順に改行区切りで出力してください。

入力される値
入力は以下のフォーマットで与えられます。

n
a_1
...
a_n

1 行目に正整数 n が、 2 行目から (n + 1) 行目には整数 a_1, ..., a_n が改行区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a_1, ..., a_n を小さい順に並べ替え、改行区切りで n 行、順に出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≤ n, a_i ≤ 50 （1 ≤ i ≤ n）

入力例1
2
4
3

出力例1
3
4

入力例2
3
2
3
1

出力例2
1
2
3
=end
