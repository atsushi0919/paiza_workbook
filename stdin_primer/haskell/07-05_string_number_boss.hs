-- 【N個の文字列の入力】1 行目で与えられる N 個の文字列の入力 (large) (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_boss

main :: IO ()
main = do
  n : s <- words <$> getContents

  mapM_ putStrLn s

{-
1 行目に、整数 N と、続けて N 個の文字列 s_1, ... , s_N が半角スペース区切りで与えられます。
s_1, ... , s_N を改行区切りで出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
以下の形式で標準入力によって与えられます。
1 行目に整数 N と N 個の文字列 s_1, ... , s_N が半角スペース区切りで与えられます。


N s_1 ... s_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
s_1, ... , s_N を改行区切りで出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


s_1
...
s_N
条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 10,000
・s_i (1 ≦ i ≦ N) は数字または大文字・小文字のアルファベットからなる長さ 1 以上 10 以下の文字列

入力例1
5 813 paiza 8iza Hello Paiza!

出力例1
813
paiza
8iza
Hello
Paiza!
-}