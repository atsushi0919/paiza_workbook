=begin
カードゲーム (paizaランク S 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search_advanced/binary_search_advanced__card_game
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたと paiza 君は、カードゲームをすることになりました。
このカードゲームのルールは、次の通りです。

・ お互いに自分の手札からカードを 1 枚場に出して、数字が大きいほうが 1 点を得る。ただし、同じ整数が出た場合は、paiza 君が得点を得る。
・ これを合計 N 回行い、合計得点が高いほうが勝者となる。ただし、同じ得点の場合は、引き分けとなる。

このカードゲームは少し特殊で、paiza 君の手札には整数が、あなたの手札にはそれぞれ一次関数 A_i x + B_i が書かれています。あなたはゲームを始める前にまず整数 x (負でもよい) を決め、その x によってあなたの手札の数字が決まります。
さらに、あなたは超能力者なので、すでに paiza 君が出すカードの順番を知っていて、i 番目に出すカードに書かれた整数は C_i です。
これらの情報をもとに、あなたは好きな順番でカードを出すことができます。
このゲームで paiza 君に勝てるような整数 x のうち、最小のものを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
A_1 B_1 C_1
A_2 B_2 C_2
...
A_N B_N C_N


・ 1 行目に、カードの枚数を表す整数 N が与えられます。
・ 続く N 行に、整数の組 A_i, B_i, C_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
問題の答えを、1 行に整数で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ N ≦ 200,000 = 2 × 10^5
・ 1 ≦ A_i, B_i, C_i ≦ 1,000,000,000 = 10^9

入力例1
3
1 2 4
2 3 10
2 1 5

出力例1
2
=end