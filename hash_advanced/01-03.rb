# ハッシュテーブルの衝突 (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__collision

INPUT1 = <<"EOS"
10
20120620
20130621
20140621
20150621
20160620
20170621
20180621
20190621
20200620
20210621
EOS
OUTPUT1 = <<"EOS"
8
0
EOS

INPUT2 = <<"EOS"
4
20220429
20220503
20220504
20220505
EOS
OUTPUT2 = <<"EOS"
0
3
EOS

INPUT3 = <<"EOS"
3
20140612
20180614
20221121
EOS
OUTPUT3 = <<"EOS"
0
0
EOS

# 計算式 1 のハッシュ値を返す
def hash1(d)
  d % 10_000
end

# 計算式 2 のハッシュ値を返す
def hash2(d)
  d / 10_000
end

# 入力
_, *a = $stdin.read.split.map(&:to_i)

# 衝突回数をカウント
count1 = count2 = 0
table1 = table2 = Array.new(10_000)
a.each do |d|
  h1 = hash1(d)
  table1[h1] ? count1 += 1 : table1[h1] = d
  h2 = hash2(d)
  table2[h2] ? count2 += 1 : table2[h2] = d
end

# 衝突回数を出力
puts count1
puts count2

=begin
データのハッシュ値を添字として用い、データを表に格納するデータ構造をハッシュテーブルと呼びます。
このデータ構造には、データの挿入や検索が O(1) でおこなえるという利点があります。

ハッシュテーブルの最もシンプルな実装は、以下のようなものです。

・ 前準備
ハッシュ関数と、配列を用意する (ハッシュ関数の出力の範囲が、配列の添字の範囲に収まるように)

・ データの挿入
データのハッシュ値を計算し、その値を添字として配列にデータを格納する

・ データの検索
データのハッシュ値を計算し、その添字の位置にデータがあるかどうかを調べる


ただし、データを格納する際にはハッシュの衝突に気をつける必要があります。
衝突とは、異なるデータに対して同じハッシュ値が出力されることを指します。

ハッシュ関数が異なると、衝突の起こりやすさも異なります。使用するデータに適したハッシュ関数を用いることが大切です。
本問では、2 つのハッシュ関数を扱います。与えられるデータに対してどちらのハッシュ関数が適しているのか考えてみましょう。

日付を表す 8 桁の整数 d_1, d_2, ..., d_N が与えられます。
以下の 2 種類のハッシュ関数 H1 と H2 を用いて得たハッシュ値を添え字としてそれぞれのハッシュテーブルに格納するとき、
別の入力から得た値が既に添え字となっていた回数、つまりそれぞれの衝突する回数を出力してください。

H1(d_i) = d_i % 10000

H2(d_i) = d_i // 10000


ただし、% は剰余を計算する演算子、// は切り捨て除算をおこなう演算子を表しています。
▼　下記解答欄にコードを記入してみよう

入力される値
N
d_1
d_2
...
d_N

1 行目にデータの数を表す整数 N が与えられます。

i + 1 行目に日付を表す整数 d_i が与えられます。(1 ≦ i ≦ N)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 行目にハッシュ関数 H1 で衝突した回数を、2 行目にハッシュ関数 H2 で衝突した回数を出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ N ≦ 366

d_i は 1973 年 1 月 1 日から2022 年 12 月 31 日までの実在する日付を yyyymmdd の形式で表した
8 桁の整数（例：2012 年 1 月 1 日は 20120101 となります）

同じ年月日は 2 回与えられない。（a ≠ b ならば、d_a ≠ d_b）
入力例1
10
20120620
20130621
20140621
20150621
20160620
20170621
20180621
20190621
20200620
20210621

出力例1
8
0

入力例2
4
20220429
20220503
20220504
20220505

出力例2
0
3

入力例3
3
20140612
20180614
20221121

出力例3
0
0
=end
