# ハッシュテーブルを使おう（オープンアドレス法） (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__open

INPUT1 = <<"EOS"
5
1 japan
1 r
2 japan
2 r
2 tokyo
EOS
OUTPUT1 = <<"EOS"
659
660
-1
EOS

INPUT2 = <<"EOS"
10
2 2GzW
1 zUM
2 8I8m6
2 zUM
2 v9J6k
1 UZ6
1 dew
1 UStXG
1 w05kr
1 d
EOS
OUTPUT2 = <<"EOS"
-1
-1
321
-1
EOS

# 定数
B = 997
MOD = 1_000

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
table = Array.new(MOD, -1)
# クエリ実行
q.each do |query|
  op, d = query.split
  idx = hash(d)
  case op
  when "1"
    # ハッシュテーブルにデータ d を格納
    # 衝突した場合は次の場所を調べる
    loop do
      if table[idx] == -1
        table[idx] = d
        break
      end
      idx = (idx + 1) % MOD
    end
  when "2"
    # データ d がハッシュテーブルの先頭から何番目かを出力
    # テーブルを一周しても見つからなければ保存されていない
    res = -1
    count = 0
    while count < MOD
      if table[idx] == d
        res = idx + 1
        break
      end
      idx = (idx + 1) % MOD
      count += 1
    end
    puts res
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



今回は前者の オープンアドレス法 を採用したハッシュテーブルを実装して、各クエリを処理してください。

ハッシュテーブルは要素数 1000 の配列とし、配列の各要素にはデータそのものを格納することとします。
なお、各要素の初期値は -1 とします。

ハッシュ関数 H は、入力で与えられるデータ d の長さを m として、
H(p) = (d の 1 文字目の文字コード * B1 + d の 2 文字目の文字コード * B2 + ... + d の m 文字目の文字コード * Bm) % mod

ただし、B = 997, mod = 1000 とし、文字コードは ASCII に従って変換してください。

ハッシュ値が衝突した場合は、空いている添え字が見つかるまで H(p) ← (H(p) + 1) % mod による更新をおこなってください。

クエリは以下の形式で入力されます。

1 d
ハッシュテーブルにデータ d を格納してください。

2 d
ハッシュテーブルにデータ d が格納されているかどうかを調べてください。
格納されているならデータ d がハッシュテーブルの先頭から何番目かを出力してください。
格納していないなら -1 と出力してください。
ただし、ハッシュテーブルの先頭のデータを 1 番目とします。
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

2 d_i

1, 2 はクエリの種類を表し、d_i は追加または検索するデータを表す文字列です。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
クエリに従って出力をおこなってください。ハッシュテーブルの添え字と出力する番号に 1 の差があることに注意してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ Q ≦ 999

d_i は長さ 1 以上 5 以下の半角英数字で構成される文字列

クエリ 1 d_i によってハッシュテーブルに d_i が格納されるとき、既に d_i がハッシュテーブルに存在していることはありません。
入力例1
5
1 japan
1 r
2 japan
2 r
2 tokyo

出力例1
659
660
-1

入力例2
10
2 2GzW
1 zUM
2 8I8m6
2 zUM
2 v9J6k
1 UZ6
1 dew
1 UStXG
1 w05kr
1 d

出力例2
-1
-1
321
-1
=end