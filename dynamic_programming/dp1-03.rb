# 特殊な2項間漸化式 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step2

INPUT1 = <<~"EOS"
  5 -7 10 5
EOS
OUTPUT1 = <<~"EOS"
  11
EOS

def solve(input_lines)
  x, d1, d2, k = input_lines.split.map(&:to_i)

  # dpテーブル初期化
  # n = 1 : x
  dp = [x]

  # dpテーブル更新
  # n >= 2
  (k - 1).times do
    dp << if dp.size.even?
      # 項が偶数のとき
      dp[-1] + d1
    else
      # 項が奇数のとき
      dp[-1] + d2
    end
  end

  # k 項の値を返す
  dp[k - 1]
end

puts solve(STDIN.read)

# 確認用コード
# p solve(INPUT1)
# > 11

INPUT2 = <<~"EOS"
  -675 464 153 146
EOS
OUTPUT2 = <<~"EOS"
  43902
EOS

=begin
特殊な2項間漸化式 1 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step2
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
整数 x, d_1, d_2, k が与えられます。
次のように定められた数列の k 項目の値を出力してください。

・ a_1 = x 
・ a_n = a_{n-1} + d_1 (n が奇数のとき、n ≧ 3) 
・ a_n = a_{n-1} + d_2 (n が偶数のとき)
(ヒント)
添字の偶奇によって漸化式の形が変わっていますが、やることはこれまでと同じです。
a_1 ~ a_{k-1} が求まっているとして、a_k をどのように計算すればよいかを考えてみましょう。
計算するときに、添字の偶奇による場合分けを行えばよいです。

入力される値
x d_1 d_2 k

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
数列の k 項目の値を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


a_k
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ -1,000 ≦ x ≦ 1,000

・ -1,000 ≦ d_1 ≦ 1,000

・ -1,000 ≦ d_2 ≦ 1,000

・ 1 ≦ k ≦ 1,000

入力例1
5 -7 10 5

出力例1
11
=end
