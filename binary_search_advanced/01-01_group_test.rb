# 集団検査 (paizaランク C 相当)
# https://paiza.jp/works/mondai/binary_search_advanced/binary_search_advanced__group_test

n = gets.to_i

cnt = 0
while n > 1
  n = (n / 2.0).ceil
  cnt += 1
end

puts cnt

=begin
paiza 国には大勢の住民がいます。今回、N 人の住民のうち誰か 1 人が謎のウイルス X に感染したことがわかりました。
しかし、それが誰かはまだわかっていません。そこで、研究者であるあなたは誰が感染したかを特定するために検査をおこなうことにしました。

検査では、各住民のサンプルを採取し、そのサンプルに薬品 C を 1 つ使用することで、感染しているかどうかを判定することができます。
しかし、薬品 C はとても高価なので、住民を 1 人ひとり検査するのではたくさんの費用が必要になってしまいます。
それで、あなたは、複数人のサンプルを混ぜることで、薬品 C を使用する回数をできるだけ少なくしたいと思っています。
ただし、複数人のサンプルを混ぜた場合は、感染者が誰かを特定することはできず、感染者が含まれているかどうかしか判定できません。

感染した 1 人がどの人であってもその人を必ず特定できるような、薬品 C の最小個数を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N


・ 1 行目に、住民の人数を表す整数 N が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
問題の答えを、一行に整数で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ N ≦ 1,000,000,000 = 10^9

入力例1
3

出力例1
2
=end
