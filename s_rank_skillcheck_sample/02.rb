# mod7占い (paizaランク S 相当)
# https://paiza.jp/works/mondai/s_rank_skillcheck_sample/mod7

INPUT1 = <<"EOS"
3
10
4
14
EOS
OUTPUT1 = <<"EOS"
1
EOS

INPUT2 = <<"EOS"
10
1
2
3
4
5
6
7
8
9
10
EOS
OUTPUT2 = <<"EOS"
17
EOS

c=0;h=`dd`.split[1..].map{|x|x.to_i%7}.tally
h.keys.repeated_combination(3).each{|i,j,k|
  next if (i+j+k)%7!=0
  l,m,n=h[i],h[j],h[k]
  m-=1 if i==j
  n-=1 if i==k
  n-=1 if j==k
  t=l*m*n
  t/=2 if i==j||i==k||j==k
  t/=3 if i==j&&j==k
  c+=t
}
p c

=begin
あなたは今、「mod7占い」というサービスを始めようと考えています。

mod7占いとは、整数が書かれた複数のカードの中から3枚を選び、そこに書かれた整数の和が7で割り切れるかどうかで運勢を決めようというものです。
カードは必ず異なる3枚を選ぶ必要があり、全てのカードには全て異なる数字が書かれています。

占いというからには、7で割り切れる組み合わせはそれなりに少なくする必要があります。
そこで、適当な複数のカードに対して、カードに書かれた3つの整数を足した和が7で割り切れるような組合せがいくつあるかを計算するプログラムを作成してください。

入力される値
入力は以下のフォーマットで与えられます。

N
a_1
a_2
...
a_N

N は与えられるカードの枚数を表します。

a_i (1 ≦ i ≦ N) はi 枚目のカードに書かれた整数であり、改行区切りでN 個与えられます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
組合せ数を一行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 100000
・0 ≦ a_i < 2^32

入力例1
3
10
4
14

出力例1
1

入力例2
10
1
2
3
4
5
6
7
8
9
10

出力例2
17
=end