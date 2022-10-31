-- 【行入力】1,000 行の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_boss

-- fmap :: Functor f => (a -> b) -> f a -> f b

main :: IO ()
main = do
  -- a <- fmap words getContents
  a <- words <$> getContents

  putStrLn $ unlines a