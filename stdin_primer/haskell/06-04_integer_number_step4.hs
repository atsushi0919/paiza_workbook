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
