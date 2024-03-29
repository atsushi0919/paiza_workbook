# ハッシュテーブルを使おう（チェイン法） (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__chain

INPUT1 = <<"EOS"
6
1 apple
2 99
1 r
2 99
3 apple
2 99
EOS
OUTPUT1 = <<"EOS"
apple
apple r
r
EOS

INPUT2 = <<"EOS"
10
1 rV
1 6ETlA
1 c
1 h
2 37
1 2WW
1 mJg
2 14
1 1sxu
3 h
EOS
OUTPUT2 = <<"EOS"
-1
-1
EOS

# 定数
B = 7
MOD = 100

# ハッシュ値を返す
def hash(d)
  tmp = 0
  d.chars.each.with_index(1) do |c, i|
    tmp += c.ord * B ** i
  end
  tmp % MOD
end

# 入力
_, *q = $stdin.read.split("\n")

# テーブル初期化
table = Array.new(MOD) { [] }
# クエリ実行
q.each do |query|
  op, d = query.split
  case op
  when "1"
    # ハッシュテーブルにデータ d を格納
    table[hash(d)] << d
  when "2"
    # d 番目に格納されているデータを先頭から順に出力
    data = table[d.to_i - 1]
    puts data.length > 0 ? data.join(" ") : -1
  when "3"
    # ハッシュテーブルのデータ d を削除
    table[hash(d)].delete(d)
  end
end

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

ただし、データを格納する際にはハッシュの衝突に気をつける必要があります。衝突への対処については、大きく分けて2つの方法があります。

・ オープンアドレス法
    衝突が解消されるまで、ハッシュ値を再計算して更新

・ チェイン法
    配列の要素をデータそのものではなくデータのリストとする。衝突した複数のデータを同じ場所に格納する

今回は後者の チェイン法 を採用したハッシュテーブルを実装して、各クエリを処理してください。

ハッシュテーブルは要素数 100 の配列とし、配列の各要素にはデータのリストを格納することとします。
なお、各要素の初期値は空リストとします。
各リストには複数のデータが含まれる可能性がありますが、格納された順番にデータが並ぶように実装してください。

ハッシュ関数 H は、入力で与えられるデータ d の長さを m として、
H(p) = (d の 1 文字目の文字コード * B^1 + d の 2 文字目の文字コード * B^2 + ... + d の m 文字目の文字コード * B^m) % mod

ただし、B = 7, mod = 100 とし、文字コードは ASCII に従って変換してください。

クエリは以下の形式で入力されます。

1 d
ハッシュテーブルにデータ d を格納してください。

2 x
ハッシュテーブルの先頭から x 番目 (1 ≦ x ≦ 100) に格納されているデータを左から格納された順番に全て出力してください。
格納されているデータが 1 つもない場合は -1 を出力してください。
ハッシュテーブルの添え字と x に 1 の差があることに注意してください。

3 d
ハッシュテーブルのデータ d を削除してください。
▼　下記解答欄にコードを記入してみよう

入力される値
Q
q_1
q_2
...
q_Q

1 行目にクエリの数を表す整数 Q が与えられます。

1 + i 行目に各クエリが与えられます。(1 ≦ i ≦ Q)

q_i は以下のいずれかの形式です。(1 ≦ i ≦ Q)
1 d_i

2 x_i

3 d_i

1, 2, 3 はクエリの種類を表し、d_i は追加または削除するデータを表す文字列、x_i はハッシュテーブルの先頭からの順番を表す整数です。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
クエリに従って出力を行ってください。

条件
1 ≦ Q ≦ 10000

d_i は長さ 1 以上 5 以下の半角英数字で構成される文字列

1 ≦ x_i ≦ 100

クエリ 1 d_i によってハッシュテーブルに d_i が格納されるとき、既に d_i がハッシュテーブルに存在していることはありません。

クエリ 3 d_i によってハッシュテーブルから d_i が削除されるとき、必ず d_i はハッシュテーブルに格納されています。
入力例1
6
1 apple
2 99
1 r
2 99
3 apple
2 99

出力例1
apple
apple r
r

入力例2
10
1 rV
1 6ETlA
1 c
1 h
2 37
1 2WW
1 mJg
2 14
1 1sxu
3 h

出力例2
-1
-1
=end
