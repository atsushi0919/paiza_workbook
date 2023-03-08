# サイクルヒット (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit

INPUT1 = <<"EOS"
4
3
2
0
1
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# # 解答例1-1
# n = 5

# single_hit = false
# two_base_hit = false
# three_base_hit = false
# home_run = false
# n.times do
#   m_i = gets.to_i
#   if m_i == 1
#     single_hit = true
#   elsif m_i == 2
#     two_base_hit = true
#   elsif m_i == 3
#     three_base_hit = true
#   elsif m_i == 4
#     home_run = true
#   end
# end

# if single_hit && two_base_hit && three_base_hit && home_run
#   puts "Yes"
# else
#   puts "No"
# end

# # 解答例1-2
# m = $stdin.read.split.map(&:to_i)

# # 0: 単打, 1: 二塁打, 2: 三塁打, 3: 本塁打
# ciclehit = Array.new(4, false)  # ciclehit = [false] * 4 でも OK

# m.each { |res| ciclehit[res - 1] = true if res > 0 }

# puts ciclehit.all? ? "Yes" : "No"

# # 解答例2-1
# m = $stdin.read.split

# results = Hash.new(0)
# m.each { |res| results[res] += 1 if res != "0" }

# puts results.length == 4 ? "Yes" : "No"

# results = INPUT1.split.select { |x| x != "0" }.tally

# # 解答例2-2
# results = $stdin.read.split.select { |x| x != "0" }.tally
# results = INPUT1.split.select { |x| x != "0" }.tally

# puts results.length == 4 ? "Yes" : "No"

=begin
サイクルヒット (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
野球のサイクルヒットとは、1 人のバッターが 1 試合の中で
単打（シングルヒット）、二塁打（ツーベース）、三塁打（スリーベース）、本塁打（ホームラン）全てを 1 本以上打った場合に成立する記録です。
パイザ君は 5 打席で、i (1 ≦ i ≦ 5)打席目の結果は m_i でした。
パイザ君がサイクルヒットを達成したかどうかを判定してください。打席の結果は単打が1、二塁打が2、三塁打が3、本塁打が4、
それ以外の結果は0と記録されます。

▼　下記解答欄にコードを記入してみよう

入力される値
m_1
m_2
...
m_5


・ 5 行のうち i (1 ≦ i ≦ n) 行目には、i 打席目の結果を表す整数 m_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
サイクルヒットの場合は「Yes」と出力してください。それ以外の場合は「No」と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 0 ≦ m_i ≦ 4

入力例1
4
3
2
0
1

出力例1
Yes
=end
