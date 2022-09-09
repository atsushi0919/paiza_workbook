# Q3: リング型のトークンパッシング (paizaランク B 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q3_token_passing


=begin

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
※この問題は、2021年1月に開催されたP共通テスト（バンタンテックフォードアカデミー中高プログラミング共通テスト）で出題された問題です。

リング型に端末が接続されたネットワークにおいて、複数の端末がデータを同時に送信すると信号が衝突してしまうことがあります。

これを防ぐために考案されたアクセス制御の仕組みとして、トークンパッシングがあります。

トークンパッシングでは、データの送信権を表す「トークン」と呼ばれる信号がリング上を高速で周回しており、データを送信したい端末はこれを取得したのち送信を開始します。

トークンを取得した端末は、データの送信が終了したらトークンを再びリングの中へと放出します。



ネットワークエンジニアの太郎君は、自社でトークンパッシング方式を採用したいと考えています。

会社のリング型ネットワークの仕様は以下の通りです。



・1 〜 N の番号がつけられた N 台の端末がリング型に接続されている。

・時計回りに 端末 1, 端末 2, ..., 端末 N の順で置かれている。

・端末 1 と端末 2 の通信には T_1 (ms), 端末 2 と端末 3 の通信には T_2 (ms), ..., 端末 N と端末 1 の通信には T_N (ms) かかる。



太郎君はトークンパッシング方式の導入にあたり、各端末が次の通りトークンを要求する場合にかかる最短の合計時間(ms) を求めたいです。



・トークンは端末 1 から周回を始め、時計回り（端末 1 → 端末 2 → ... 端末 N → 端末 1 → ...) に周回するものとする。

・トークンの要求が K 回発生する。i 回目で要求を行う端末の番号は D_i で与えられる。(1 ≦ i ≦ K)

・i 回目の送信が終わり、トークンが放出された瞬間に i+1 回目のトークンの要求がおこなわれる。

（i 回目のトークンの要求と i+1 回目のトークンの要求が同じ端末でおこなわれた場合、トークンが 1 周することに注意する）

・データの送信にかかる時間は考慮しないものとする。



仕様に関する情報が与えられるので、以上の通りトークンを要求した場合にかかる最短の合計時間(ms) を求めましょう。



例として、入力例 1 では、以下の通りトークンが渡っていき、最終的に赤い部分の通信路を一度ずつ通ることになるので、求める合計時間は 10(ms) となります。










▼　下記解答欄にコードを記入してみよう

入力される値
N K
T_1
...
T_N
D_1
...
D_K


・ 1 行目には端末の数を表す整数 N , トークンの要求回数を表す整数 K が与えられます。
・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) には、端末 i と端末 i+1 の通信にかかる時間 T_i(ms) が与えられます。ただし、N 行目では端末 N と端末 1 の通信にかかる時間が与えられます。
・ 続く K 行のうち i 行目 (1 ≦ i ≦ K) には、i 回目のトークン要求をおこなう端末の番号 D_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・端末 D_K がトークンを取得するまでにかかる最短の合計時間(ms) を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・2 ≦ N ≦ 100,000
・1 ≦ K ≦ 100,000
・1 ≦ T_i ≦ 100 (1 ≦ i ≦ N)
・1 ≦ D_i ≦ N (1 ≦ i ≦ K)
・D_1 ≠ 1

入力例1
4 2
1
2
3
4
2
1

出力例1
10

入力例2
5 3
10
20
30
40
50
4
3
3

出力例2
330
=end