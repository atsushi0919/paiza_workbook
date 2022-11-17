-- 改行区切りでの N 個の文字列の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_step1

-- 入力例1
-- 5
-- hello
-- paiza
-- 813
-- paiza2020
-- Nice

-- 出力例1
-- hello
-- paiza
-- 813
-- paiza2020
-- Nice

main :: IO ()
main = do
  n <- getLine
  s <- lines <$> getContents

  putStr $ unlines s



{-

import Control.Monad
main = do
  n <- readLn
  ss <- repliciateM n getLine
  putStrLn $ solve n ss

solve :: Int -> [String] -> String
solve = undefined

showInt :: Int -> String
showInt = show

readInt :: String -> Int
readInt = read

main :: IO ()
main = interact func

func :: String -> String
func input = case lines input of
    _:ss -> unlines [show (sum [length s | s <-ss])]

1 行目に整数 N が与えられます。
2 行目以降に、N 個の文字列 s_1, ... , s_N が N 行で与えられます。
s_1, ... , s_N を改行区切りで出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
以下の形式で標準入力によって与えられます。
1 行目に整数 N が、 2 行目から (N + 1) 行目に文字列 s_1, ... , s_N が N 行で与えられます。


N
s_1
...
s_N

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

・1 ≦ N ≦ 100
・s_i (1 ≦ i ≦ N) は数字または大文字・小文字のアルファベットからなる長さ 1 以上 10 以下の文字列

入力例1
5
hello
paiza
813
paiza2020
Nice

出力例1
hello
paiza
813
paiza2020
Nice
-}