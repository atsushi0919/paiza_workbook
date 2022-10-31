-- 半角スペース区切りの 3 つの入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_step3

main :: IO ()
main = do
  [s1, s2, s3] <- words <$> getLine

  putStrLn s1
  putStrLn s2
  putStrLn s3
