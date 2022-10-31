-- 【整数の行入力】1,000行の整数の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_row_boss

toInt :: String -> Int
toInt x = read x :: Int

toStr :: Int -> String
toStr x = show x :: String

main :: IO ()
main = do
  inputStr <- getContents

  let intNums = map toInt $ lines inputStr

  putStr $ unlines $ map toStr intNums
