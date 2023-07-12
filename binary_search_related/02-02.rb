# 家庭菜園 (paizaランク A 相当)
# https://paiza.jp/works/mondai/binary_search_related/binary_search_related__related_algorithms_2

INPUT1 = <<"EOS"
2
1 0
-1 2
EOS
OUTPUT1 = <<"EOS"
1 1
EOS

def illuminate_bound(x, mid)
  while (uy - ly).round(6) > 0
    mid = (uy - ly) / 2
    $ab.any? {|a, b| mid <= a * x + b} ? ly = mid : uy = mid
  end
end

# _, *$ab = $stdin.read.split("\n").map {|r|r.split.map(&:to_i)}
_, *$ab = INPUT1.split("\n").map {|r|r.split.map(&:to_i)}

lx = 2 * -10**9 - 1.0
rx = 2 *  10**9 + 1.0
while (rx - lx).round(6) > 0
  mx = (rx - lx) / 2
  uy =  2 *  10**9 + 1.0
  ly =  2 * -10**9 - 1.0
  while (uy - ly).round(6) > 0
    my = (uy - ly) / 2
    
  end
end

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
paiza 君の家では、家庭菜園をしています。
菜園には n 個の照明があり、i 番目の照明は y ≦ a_i x + b_i を満たす領域をカバーしています。
paiza 君は、これらの照明のどれにも照らされていない領域のうち、最も高さが低い場所を見つけたいと思っています。
これらの領域に含まれない座標のうち、最も y 座標が小さいものを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 b_1
a_2 b_2
...
a_n b_n

・ 1 行目には、照明の数 n が与えられます。
・ 続く n 行には、i 番目の照明の傾き a_i と切片 b_i がこの順に半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
どの照明にも照らされていない領域のうち、最も y 座標が小さい場所の x 座標と y 座標をこの順に半角スペース区切りで出力してください。
また、末尾に改行を入れ、余計な文字を含んではいけません。

相対誤差または絶対誤差が 10^-6 以下であれば正解とみなします。

条件
・ 2 ≦ n ≦ 100000 = 10^5
・ |a_i|, |b_i| ≦ 1000000000 = 10^9
・ a_i > 0 を満たす i が存在する
・ a_i < 0 を満たす i が存在する
・ 入力はすべて整数

入力例1
2
1 0
-1 2

出力例1
1 1
=end