-- 100 行の整数の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_row_step4

toInt :: String -> Int
toInt x = read x :: Int

toStr :: Int -> String
toStr x = show x :: String

main :: IO ()
main = do
  inputStr <- getContents

  let strNums = lines inputStr
  let intNums = map toInt strNums
  let outputStr = unlines $ map toStr intNums

  putStr outputStr
