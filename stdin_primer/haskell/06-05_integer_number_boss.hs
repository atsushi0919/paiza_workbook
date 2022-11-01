-- 【N 個の整数の入力】1 行目で与えられる N 個の整数の入力 (large) (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_number_boss

-- mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()

toInt :: String -> Int
toInt x = read x :: Int

main :: IO ()
main = do
  n : a <- map toInt . words <$> getLine

  mapM_ print a
