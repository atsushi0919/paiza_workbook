-- 半角スペース区切りの 10 個の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step4

main :: IO ()
main = do
  inputWords <- words <$> getLine

  putStrLn (unlines inputWords)
