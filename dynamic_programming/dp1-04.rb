# 特殊な2項間漸化式 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step3

INPUT1 = <<~"EOS"
  3 7 -4
  5
  1
  2
  3
  4
  10
EOS
OUTPUT1 = <<~"EOS"
  3
  -1
  6
  2
  11
EOS

def solve(input_lines)
  x, d1, d2, q, *ary_k = input_lines.split.map(&:to_i)

  # dpテーブル初期化
  # n = 1 : x
  dp = [x]

  # 最大の項
  k_max = ary_k.max

  # dpテーブル更新
  # n >= 2
  (ary_k.max - 1).times do
    dp << if dp.size.even?
      # 項が偶数のとき
      dp[-1] + d1
    else
      # 項が奇数のとき
      dp[-1] + d2
    end
  end

  # ary_k の先頭から順に k 項の値を返す
  ary_k.map { |k| dp[k - 1] }
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 3
# > -1
# > 6
# > 2
# > 11

=begin
特殊な2項間漸化式 2 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step3
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
整数 x, d_1, d_2, Q と Q 個の整数 k_1, k_2, ... , k_Q が与えられます。

次のように定められた数列の k_i 項目の値を順に出力してください。


・ a_1 = x 
・ a_n = a_{n-1} + d_1 (n が奇数のとき、n ≧ 3) 
・ a_n = a_{n-1} + d_2 (n が偶数のとき)
入力される値
x d_1 d_2
Q
k_1
k_2
...
k_Q


・ 1行目では、数列の初項 x と公差 d_1, d_2 が与えられます。

・ 2行目では、3行目以降で与えられる入力の行数 Q が与えられます。

・ 続く Q 行のうち i 行目では、k_i が与えられます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
Q 行出力してください。

i 行目には、数列の k_i 項目の値を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


a_{k_1}
a_{k_2}
...
a_{k_Q}
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ -1,000 ≦ x ≦ 1,000

・ -1,000 ≦ d_1 ≦ 1,000

・ -1,000 ≦ d_2 ≦ 1,000

・ 1 ≦ Q ≦ 1,000

・ 1 ≦ k_i ≦ 1,000 (1 ≦ i ≦ Q)

入力例1
3 7 -4
5
1
2
3
4
10

出力例1
3
-1
6
2
11
=end
