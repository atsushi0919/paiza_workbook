-- 5 つの整数の半角スペース区切りの入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_step3

toInt :: String -> Int
toInt x = read x :: Int

toStr :: Int -> String
toStr x = show x :: String

main :: IO ()
main = do
  inputStr <- getLine

  let strNums = words inputStr
  let intNums = map toInt strNums

  putStrLn (toStr (intNums !! 0))
  putStrLn (toStr (intNums !! 1))
  putStrLn (toStr (intNums !! 2))
  putStrLn (toStr (intNums !! 3))
  putStrLn (toStr (intNums !! 4))
