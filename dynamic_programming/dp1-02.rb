# 2項間漸化式 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step1

INPUT1 = <<~"EOS"
  0 7
  5
  1
  2
  3
  4
  5
EOS
OUTPUT1 = <<~"EOS"
  0
  7
  14
  21
  28
EOS

def solve(input_lines)
  x, d, q, *ary_k = input_lines.split.map(&:to_i)

  # dpテーブル初期化
  # n = 1 : x
  dp = [x]

  # 最大の項
  k_max = ary_k.max

  # dpテーブル更新
  # n <= 2 : dp[n - 1] + d
  (k_max - 1).times do
    dp << dp[-1] + d
  end

  # ary_k の先頭から順に k 項の値を返す
  ary_k.map { |k| dp[k - 1] }
end

puts solve(INPUT2)

# 確認用コード
# puts solve(INPUT1)
# > 0
# > 7
# > 14
# > 21
# > 28

=begin
2項間漸化式 2 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step1
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
整数 x, d, Q と Q 個の整数 k_1, k_2, ... , k_Q が与えられます。

次のように定められた数列の k_i 項目の値を順に出力してください。


・ a_1 = x
・ a_n = a_{n-1} + d (n ≧ 2)
入力される値
x d
Q
k_1
k_2
...
k_Q


・ 1行目では、数列の初項 x と公差 d が半角スペース区切りで与えられます。

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

・ -1,000 ≦ d ≦ 1,000

・ 1 ≦ Q ≦ 1,000

・ 1 ≦ k_i ≦ 1,000 (1 ≦ i ≦ Q)

入力例1
0 7
5
1
2
3
4
5

出力例1
0
7
14
21
28
=end
