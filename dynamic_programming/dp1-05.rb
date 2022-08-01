# 3項間漸化式 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step4

INPUT1 = <<~"EOS"
  7
EOS
OUTPUT1 = <<~"EOS"
  13
EOS

def solve(input_data)
  k = input_data.to_i

  # dpテーブル初期化
  # n = 1 : 1
  # n = 2 : 1
  dp = [1, 1]

  # dpテーブル更新
  # n >= 3 : dp[n - 2] + dp[n - 1]
  (k - 2).times do |n|
    dp << dp[-2] + dp[-1]
  end

  # k 項の値を返す
  dp[k - 1]
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 13

=begin
3項間漸化式 1 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step4
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
整数 k が与えられます。
次のように定められた数列の k 項目の値を出力してください。
ちなみに、これはフィボナッチ数列と呼ばれる有名な数列です。

・ a_1 = 1 
・ a_2 = 1 
・ a_n = a_{n-2} + a_{n-1} (n ≧ 3)
(ヒント)
漸化式に登場する項の数が2つから3つへ増えましたが、やはりやることはこれまでと同じです。

入力される値
k

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
数列の k 項目の値を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


a_k
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ k ≦ 40

入力例1
7

出力例1
13
=end
