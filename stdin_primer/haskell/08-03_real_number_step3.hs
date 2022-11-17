-- 1 行目で与えられる N 個の実数の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__real_number_step3

toFloat :: String -> Float
toFloat x = read x :: Float

main :: IO ()
main = do
  n : a <- words <$> getContents

  let f = map toFloat a

  putStr $ unlines a

{-
1 行目で、整数 N と、続けて N 個の実数 a_1, ... , a_N が半角スペース区切りで与えられます。
a_1, ... , a_N を改行区切りでそのまま出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
以下の形式で標準入力によって与えられます。
1 行目に整数 N と N 個の実数 a_1, ... , a_N が半角スペース区切りで与えられます。


N a_1 ... a_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a_1, ... , a_N を改行区切りで出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


a_1
...
a_N
条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 100
・a_i (1 ≦ i ≦ N) は 1 以上 1,000 以下の実数
・また a_i は小数点以下 3 桁までの実数

入力例1
5 8.13 81.3 813 0.813 1.381

出力例1
8.13
81.3
813
0.813
1.381
-}