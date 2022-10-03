=begin
動的計画法によるTSP (2) (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_dynamic_2
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
巡回セールスマン問題とは、都市の集合と各都市間の距離が与えられ、全都市をちょうど1回ずつ訪れたのち出発した都市に戻ってくるような経路 (巡回路) のうち最も短いものを求める問題です。

前問では動的計画法によって巡回路長の最小値を求めましたが、巡回路そのもの (都市の並び) は求めることができていません。
実は、前回実装したコードに少し手を加えると、巡回路を求めることができます。


{   
    double d[n][1 << n];
    int before[n][1 << n]; /* 追加 */

    for(int i = 0; i < n; i++){
        for(int b = 0; b < 1 << n; b++){
            d[i][b] = (非常に大きな値);
        }
    }

    for(int i = 0; i < n; i++){
        d[i][1 << i] = (都市 s から 都市 i への距離);
        before[i][1 << i] = s /* 追加 */
    }

    for(int b = 0; b < 1 << n; b++){
        for(int i = 0; i < n; i++){
            if((b>>i & 1) == 0) continue;
            for(j = 0; j < n; j++){
                if((b>>j & 1) == 1) continue;
                double tmp = d[i][b] + (都市 i から都市 j への距離);
                if(tmp < d[j][b | (1 << j)]){
                    d[j][b | (1 << j)] = tmp;
                    before[j][b | (1 << j)] = i; /* 追加 */
                }
            }
        }
    }

    /* 追加 */
    int tour[n], pos = s, b = (1 << n)-1;
    for(int i = 0; i < n; i++){
        tour[i] = before[pos][b];
        b = b ^ (1 << pos);
        pos = tour[i];
    }
    // この時点で、tour は最小の巡回路長を達成する巡回路になっている

    return d[s][(1 << n)-1];
}

距離 d を更新した際に、都市 j の直前に訪れた都市 i を before に保存しています。最後に、都市 0 からスタートして直前に訪れた都市を繰り返し計算することで、巡回路を求めています。

n 個の都市 (都市 0、都市 1、...、都市 n-1) のデータが与えられます。上の動的計画法を実装し、巡回路長の最小値と、最小値を達成する巡回路を求めてください。なお、各都市は二次元平面上の点として与えられ、都市間の距離にはユークリッド距離を用いるものとします。

正解は一通りとは限りません。巡回路が正しく、巡回路長が最小であれば正解と判定されます。
例えば入力例 1 では巡回路を 2 1 3 0 や 1 2 0 3 と出力しても正解と判定されます。
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
1 行目に巡回路長の最小値を出力してください。絶対誤差が 10^-6 以下なら正解と判定されます。
2 行目に巡回路長が最小となるような巡回路を出力してください。巡回路は、都市番号 (0, 1, ... , n-1) の順列で表し、半角スペース区切りで出力してください。

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
1 3 0 2
=end