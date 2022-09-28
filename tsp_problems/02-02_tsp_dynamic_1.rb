# 動的計画法によるTSP (1) (paizaランク A 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_dynamic_1

INPUT1 = <<~"EOS"
  4
  0 0
  2 2
  -1 1
  0 -2
EOS
OUTPUT1 = <<~"EOS"
  11.048627177541
EOS

=begin
動的計画法によるTSP (1) (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_dynamic_1
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
巡回セールスマン問題とは、都市の集合と各都市間の距離が与えられ、
全都市をちょうど1回ずつ訪れたのち出発した都市に戻ってくるような経路 (巡回路) のうち最も短いものを求める問題です。

ここでは、巡回セールスマン問題を動的計画法で解くことを考えます。

ある都市 s からスタートして、集合 S に含まれるすべての都市を訪れ、都市 j に到達する最短路を p(j, S)、その長さを d(j, S) とおきます。

まず、簡単にわかることとしてd(j, {j}) = (都市 s から都市 j までの距離)が挙げられます。

次に、p(j, S) において j の直前に訪れる頂点を i とします。すると、p(j, S) の頂点 i に到達するまでの部分路は、
都市 s からスタートして集合 S - {j} に含まれるすべての都市を訪れ、頂点 i に到達する最短路になっているはずです。
従って、d(j, S) は d(i, S - {j}) + (都市 i から都市 j までの距離) (ただし i は S - {j} に含まれる都市) の最小値となっていなければなりません。

巡回セールスマン問題の答えは、d(s, {0, 1, ... , n-1}) です。
これを求めるには、集合 S のサイズが 1 のもの d(0, {0}), d(1, {1}), ... , d(n-1, {n-1}) からスタートして、
S のサイズを 1 つずつ大きくしていけば良いです。

以上の考察に基づいて問題を解くコードを考えると、以下のようになります。
前問で扱ったビット列による表現を用いて都市の集合を表していることに注意してください。
なお、コード中の (<<) 演算子は左ビットシフトを表しています。


{   
    double d[n][1 << n]; // d[i][b] = d(i, S) (b は S のビット列による表現)

    // d の初期化
    for(int i = 0; i < n; i++){
        for(int b = 0; b < 1 << n; b++){
            d[i][b] = (非常に大きな値);
        }
    }

    // 集合 S のサイズが 1 の場合
    for(int i = 0; i < n; i++){
        d[i][1 << i] = (都市 s から 都市 i への距離);
    }

    // 集合のサイズを 1 つずつ大きくしていく
    for(int b = 0; b < 1 << n; b++){
        for(int i = 0; i < n; i++){
            if((b>>i & 1) == 0) continue;
            for(j = 0; j < n; j++){
                if((b>>j & 1) == 1) continue;
                double tmp = d[i][b] + (都市 i から都市 j への距離);
                if(tmp < d[j][b | (1 << j)]){
                    d[j][b | (1 << j)] = tmp;
                }
            }
        }
    }
    return d[s][(1 << n)-1];
}


n 個の都市 (都市 0、都市 1、...、都市 n-1) のデータが与えられます。上の動的計画法を実装し、巡回路長の最小値を求めてください。
なお、各都市は二次元平面上の点として与えられ、都市間の距離にはユークリッド距離を用いるものとします。
▼　下記解答欄にコードを記入してみよう

入力される値
n
x_0 y_0
x_1 y_1
...
x_{n-1} y_{n-1}


・ 1 行目に都市の個数 n が与えられます。
・ 続く n 行のうち i (1 ≦ i ≦ n) 行目には、都市 i-1 の座標が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
巡回路長の最小値を出力してください。絶対誤差が 10^-6 以下なら正解と判定されます。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 入力はすべて整数
・ 2 ≦ n ≦ 16
・ -1,000 ≦ x_i, y_i ≦ 1,000 (0 ≦ i ≦ n-1)
・ i ≠ j ならば (x_i, y_i) ≠ (x_j, y_j)

入力例1
4
0 0
2 2
-1 1
0 -2

出力例1
11.048627177541
=end
