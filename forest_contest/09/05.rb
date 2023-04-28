# 卵をぴったり生産 (paizaランク A 相当)
# https://paiza.jp/works/mondai/forest_contest_009/forest_contest_009__a_egg4

INPUT1 = <<"EOS"
4 8
5 3 8 2
EOS
OUTPUT1 = <<"EOS"
2
EOS

# 入力
n, k, *a = $stdin.read.split.map(&:to_i)

# 産卵数 k 個以下の鶏に絞る (0 ≦ a_i ≦ 100)
a.select! { |a_i| a_i <= k }

# 残った鶏の組み合わせで作れる卵の和を調べる
dp = [1].concat(Array.new(k, 0))
a.each do |a_i|
  k.downto(a_i) { |j| dp[j] += dp[j - a_i] }
end

# 出力
puts dp[k]

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
ニワトリが n 羽います。各々のニワトリは a_i 個 (1 ≦ i ≦ n)の卵を産みます。
それぞれのニワトリを自由に選択し、（この場合選び方は全部で 2 ^ n 通りあります。）
選んだニワトリが産む卵の総和が k 個になる選び方は何通りあるか求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n k
a_1 ... a_n


・ 1 行目に n, k がそれぞれ整数で半角スペース区切りで与えられます。
・ 2 行目にそれぞれのニワトリが産む卵の個数 a_i (1 ≦ i ≦ n)が整数で半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
選んだニワトリが産む卵の総和が k 個になるのは何通りか出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 15
・ 0 ≦ k ≦ 1500
・ 0 ≦ a_i ≦ 100

入力例1
4 8
5 3 8 2

出力例1
2
=end
