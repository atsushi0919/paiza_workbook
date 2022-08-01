# 配列（リスト）の要素の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/string_count_2

ary = ["Nara", "Shiga", "Hokkaido", "Chiba"]

# [解答例1]
n = ary.length
(0..n - 1).each { |idx| puts ary[idx] }

# [解答例2]
puts ary

=begin
配列（リスト）の要素の出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/string_count_2
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
指定された配列（リスト）を定義し、配列（リスト）の要素をインデックス順に１行ずつ出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
なし

"Nara", "Shiga", "Hokkaido", "Chiba"
を要素に持つ配列（リスト）をプログラムで定義し、使用すること。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
配列（リスト）の要素をインデックス順に１行ずつ、全て表示してください。

Nara
Shiga
Hokkaido
Chiba

最後は改行し、余計な文字、空行を含んではいけません。

条件
なし
=end
