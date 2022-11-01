-- 1 つの整数の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_step1

main :: IO ()
main = do
  a <- readLn :: IO Int

  print a
