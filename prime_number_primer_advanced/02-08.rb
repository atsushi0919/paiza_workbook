# 最大公約数と最小公倍数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__race_common

# 入力
abc = gets.split.map(&:to_i)

# a, b, c の最小公倍数を出力
puts abc.inject { |res, n| res.lcm n }

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
三人の選手が、それぞれ A 秒、B 秒、C 秒でトラックを一周します。
この三人がスタートしてから、もう一度同時にスタートラインを通過するのはスタートしてから何秒後でしょうか？

トラックを一周する秒数は常に一定であり、A 秒、B 秒、C 秒より遅く周回したり早く周回するといったことはありません。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 A B C が与えられます。


A B C

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
三人の選手がスタートしてから、再度同時にスタートラインを通過する秒数を求め、一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ A, B, C ≦ 1,000

入力例1
40 50 60

出力例1
600

入力例2
60 60 60

出力例2
60

入力例3
5 60 504

出力例3
2520
=end
