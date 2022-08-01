# 3項間漸化式 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_boss

INPUT1 = <<~"EOS"
  5
  1
  2
  3
  4
  3
EOS
OUTPUT1 = <<~"EOS"
  1
  1
  2
  3
  2
EOS

def solve(input_lines)
  q, *ary_k = input_lines.split("\n").map(&:to_i)

  # dpテーブル初期化
  # n = 1 : 1
  # n = 2 : 1
  dp = [1, 1]

  # 最大の項
  k_max = ary_k.max

  # dpテーブル更新
  # n >= 3 : dp[n - 2] + dp[n - 1]
  (k_max - 2).times do |n|
    dp << dp[-2] + dp[-1]
  end

  # ary_k の先頭から順に k 項の値を返した結果を改行区切りの配列にして末尾に改行を追加
  ary_k.map { |k| dp[k - 1] }.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 1
# > 1
# > 2
# > 3
# > 2

=begin
【漸化式】 3項間漸化式 2 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_boss
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
整数 Q と Q 個の整数 k_1, k_2, ... , k_Q が与えられます。

次のように定められた数列の k_i 項目の値を順に出力してください。

ちなみに、これはフィボナッチ数列と呼ばれる有名な数列です。


・ a_1 = 1 
・ a_2 = 1 
・ a_n = a_{n-2} + a_{n-1} (n ≧ 3)
入力される値
Q
k_1
k_2
...
k_Q


・ 1行目では、2行目以降で与えられる入力の行数 Q が与えられます。

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

・ 1 ≦ Q ≦ 100

・ 1 ≦ k_i ≦ 40 (1 ≦ i ≦ Q)

入力例1
5
1
2
3
4
3

出力例1
1
1
2
3
2
=end
