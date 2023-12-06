=begin
問題 11 : 動的な文字列に対する mp アルゴリズム (paizaランク S 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/mp_kmp_algorithm/mp_kmp_algorithm__kmp_boss
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
初め、文字列 S は空文字列です。
あなたは Q 個のクエリを処理しつつ、各クエリの処理が終わるたびに以下の計算結果を出力してください。
・S の接頭辞であり、接尾辞でもあるような文字列のうち最長のものの長さを出力してください。
ただし、空文字列の長さは 0 とし、
文字列 S の接頭辞、接尾辞は空文字列を含み、S 自身を含まないものとします。

各クエリは以下のいずれか形式で与えられます。
・1 c : S の右端の文字を c に変更する
・2 c : S の末尾に文字 c を追加する


ヒント :
以下にアルゴリズムの方針を軽く示すので、参考にしてください。



▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます


Q 
query_1
query_2
.
.
.
query_Q

1 行目にはクエリの個数を表す整数 Q が与えられ、続く Q 行にはクエリが与えられます。
各クエリは以下の形式のいずれかで与えられます。
1 c

2 c

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
Q 回のクエリ処理が終わるたびに
・S の接頭辞であり、接尾辞でもあるような文字列のうち最長のものの長さを表す整数を出力してください。また、末尾には改行を入れてください。
余計な文字や空白、空行を出力しないようにしてください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・2 ≦ Q ≦ 500000
・各クエリで与えられる文字 c は英小文字である
・最初のクエリの形式は 2 c である

入力例1
10
2 p
1 a
2 i
2 z
2 a
1 a
1 z
2 i
1 a
2 p

出力例1
0
0
0
0
1
1
0
0
1
0
=end
