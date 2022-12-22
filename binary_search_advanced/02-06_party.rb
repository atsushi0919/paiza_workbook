=begin
パーティー (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search_advanced/binary_search_advanced__party
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
先日、paiza 君とその友達合計 N 人でパーティーをしました。そのうち i 番目の人は、時刻 A_i に到着し、時刻 L_i に帰りました。つまり、時刻 A_i から L_i までパーティーに参加しました。
N 人それぞれについて、残りの N - 1 人のうち、その人と同時にパーティーに参加していた人の合計人数を求めてください。
ただし、2 人以上が同時に到着した・帰った場合も、その人たちは同時にパーティーに参加していたものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
N
A_1 L_1
A_2 L_2
...
A_N L_N


・ 1 行目に、パーティーの人数を表す整数 N が与えられます。
・ 続く N 行に、整数の組 A_i, L_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 番目の人に対する問題の答えを、i 行目に整数で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ N ≦ 200,000 = 2 × 10^5
・ 1 ≦ A_i < L_i ≦ 1,000,000,000 = 10^9

入力例1
3
1 3
2 5
4 6

出力例1
1
2
1
=end