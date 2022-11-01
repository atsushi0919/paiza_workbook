-- 【整数の半角スペース区切りの入力】1,000個の整数の半角スペース区切りの入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_boss

toInt :: String -> Int
toInt x = read x :: Int

toStr :: Int -> String
toStr x = show x :: String

main :: IO ()
main = do
  inputStr <- getLine

  let intNums = map toInt $ words inputStr

  putStr $ unlines $ map toStr intNums
