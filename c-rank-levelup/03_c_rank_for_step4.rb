# 多重ループ (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_for_step4

# [解答例1]
m = gets.to_i
ary_c = []
for _ in 0...m
  ary_c << gets.chomp
end
n = gets.to_i
ary_s = []
for _ in 0...n
  ary_s << gets.chomp
end

for c_i in 0...m
  for s_i in 0...n
    flag = false
    word = ary_s[s_i]
    for w_i in 0...word.length
      if ary_c[c_i] == word[w_i]
        flag = true
        break
      end
    end
    if flag
      puts "YES"
    else
      puts "NO"
    end
  end
end

# [解答例2]
m = gets.to_i
ary_c = m.times.map { gets.chomp }
n = gets.to_i
ary_s = n.times.map { gets.chomp }

ary_c.each do |char|
  ary_s.each do |word|
    puts word.include?(char) ? "YES" : "NO"
  end
end

=begin
問題
Img 04 03 下記の問題をプログラミングしてみよう！
m 個の文字 c_1, ..., c_m と、 n 個の文字列 S_1, ..., S_n が与えられます。各 c_i （1 ≤ i ≤ m） について、各 S_j （1 ≤ j ≤ n） に c_i が出現するかをそれぞれ調べ、出現する場合は "YES" を、そうでない場合には "NO" を、そのつど出力してください。

入力される値
入力は以下のフォーマットで与えられます。

m
c_1
...
c_m
n
S_1
...
S_n

1 行目に正整数 m が、 2 行目から (m + 1) 行目では文字 c_1, ...,c_m が、
(m + 2) 行目に正整数 n が、 (m + 3) 行目から ( m + n + 2) 行目では文字列 S_1, ..., S_n が、
それぞれ改行区切りで与えられます（入力は全部で (m + n + 2) 行）。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
c_1 が S_1 に出現するかどうか、 c_1 が S_2 に出現するかどうか、 ... 、 c_1 が S_n に出現するかどうか、
c_2 が S_1 に出現するかどうか、 c_2 が S_2 に出現するかどうか、 ... 、 c_2 が S_n に出現するかどうか、 ... 、
c_m が S_1 に出現するかどうか、 c_m が S_2 に出現するかどうか、 ... 、 c_m が S_n に出現するかどうか、
という順番で m * n 回出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≤ m, n ≤ 50
・各 c_i, S_j (1 ≤ i ≤ m, 1 ≤ j ≤ n） はそれぞれアルファベット大文字あるいは小文字からなる文字、文字列
・各 S_j （1 ≤ j ≤ n） の長さは 1 以上 10 以下

入力例1
1
a
2
paiza
kyoko

出力例1
YES
NO

入力例2
2
c
d
2
cat
dog

出力例2
YES
NO
NO
YES
=end
