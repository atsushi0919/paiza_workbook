-- 【半角スペース区切りの入力】半角スペース区切りの 1,000 個の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_boss

main :: IO ()
main = do
  inputWords <- words <$> getLine

  putStrLn $ unlines inputWords
