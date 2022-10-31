-- 2 行の整数の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_row_step2

main :: IO ()
main = do
  a <- readLn :: IO Int
  b <- readLn :: IO Int

  print a
  print b
