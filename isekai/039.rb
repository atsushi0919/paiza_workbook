# 数式の計算（ 1 桁）

p eval gets

=begin
正しい数式を表す文字列 S が与えられるので、その数式を計算した結果を出力してください。
ただし、出てくる計算は足し算・引き算のみとし、数式に項として出てくる数字は全て 1 桁の正の数であるものとします。
例として、1-2, 2+1-7 のような文字列は与えられる可能性がありますが、1+(-2) や -4-2+4, 5+-2 のような文字列は与えられないことが保証されている点に注意してください。

・ 例
・ S = "1+1"
答えは 2 となります。

・ S = "4+3-2+1"
答えは 6 となります。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

S
・ 文字列 S が 1 行で与えられます。

条件
・ 1 ≦ |S| ≦ 10000 ( |S| は、 S の文字数です。)
・ 計算過程で出てくる値や計算結果の絶対値は必ず 10^8 以下になります。
・ S は正しい表記の式です。
・ S に項として出てくる数字は全て 1 桁の正の数であるものとします。

出力される値
S を数式として見たときの計算結果を 1 行で出力してください。

入力例

1+2+3

出力例

6
=end