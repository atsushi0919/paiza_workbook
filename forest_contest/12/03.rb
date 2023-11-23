# グラフの連結 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_012/forest_contest_012__c_triconnect

INPUT1 = <<"EOS"
2
0 1
1 2
EOS
OUTPUT1 = <<"EOS"
Yes
EOS

INPUT2 = <<"EOS"
1
1 2
EOS
OUTPUT2 = <<"EOS"
No
EOS

INPUT3 = <<"EOS"
3
0 1
0 2
1 2
EOS
OUTPUT3 = <<"EOS"
Yes
EOS

INPUT4 = <<"EOS"
0
EOS

OUTPUT4 = <<"EOS"
No
EOS

n = 3
_, *ab = $stdin.read.split("\n").map { |l| l.split.map(&:to_i) }

# 隣接リスト
ad_list = Array.new (n) { [] }
ab.each { |a, b| ad_list[a] << b }

# 頂点 0 から 頂点 2 に行けるか？
reachable = if ad_list[0].include?(2)
    # Yes 0 -> 2
    true
  elsif ad_list[0].include?(1) && ad_list[1].include?(2)
    # Yes 0 -> 1 -> 2
    true
  else
    # No
    false
  end

puts reachable ? "Yes" : "No"

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
3 つの頂点0, 1, 2からなる無向グラフが与えらます。
頂点 0 から出発して、辺をたどって頂点 2 に到達できるならば、"Yes" を、そうでないならば "No" を出力してください。

例えば、0 と 1 を結ぶ辺と、1 と 2 を結ぶ辺があれば、0、1、2と順に辺をたどって、頂点 2 にたどりつくことができます。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 b_1
...
a_n b_n


・1行目で辺の数 n が与えられます。
・続く n 行で、辺が与えらます。辺はa_i, b_iの2つの頂点からなり、a_iとb_iを結ぶ辺が存在することを表します。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
"Yes" か "No" を1行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 0 <= n <= 3
・ a = 0, 1, 2のいずれか
・ b = 0, 1, 2のいずれか
・ a < b
・ 同じ辺が重複して与えられることはありません

入力例1
2
0 1
1 2

出力例1
Yes

入力例2
1
1 2

出力例2
No

入力例3
3
0 1
0 2
1 2

出力例3
Yes

入力例4
0

出力例4
No
=end
