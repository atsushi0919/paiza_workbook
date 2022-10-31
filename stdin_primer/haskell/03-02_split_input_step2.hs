-- 半角スペース区切りの 2 つの入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step2

main :: IO ()
main = do
  [s1, s2] <- words <$> getLine

  putStrLn s1
  putStrLn s2
