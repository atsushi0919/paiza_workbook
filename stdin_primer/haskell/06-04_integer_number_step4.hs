-- 2 行目で与えられる N 個の整数の入力 (large) (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_step4

toInt :: String -> Int
toInt x = read x :: Int

toStr :: Int -> String
toStr x = show x :: String

main :: IO ()
main = do
  n : a <- map toInt . words <$> getContents

  putStr $ unlines $ map toStr a


{-
1 行目で整数 N が与えられます。
2 行目で、N 個の整数 a_1, ... , a_N が半角スペース区切りで与えられます。
a_1, ... , a_N を改行区切りで出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
以下の形式で標準入力によって与えられます。
1 行目に整数 N が、2 行目に整数 a_1, ... , a_N が半角スペース区切りで与えられます。


N
a_1 ... a_N

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

・入力はすべて整数
・1 ≦ N ≦ 1,000
・1 ≦ a_i ≦ 10,000 (1 ≦ i ≦ N)

入力例1
5
8 1 3 10 100

出力例1
8
1
3
10
100
-}