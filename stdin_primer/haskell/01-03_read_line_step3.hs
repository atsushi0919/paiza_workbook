-- 3 行の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step3

main :: IO()
main = do
  s0 <- getLine
  s1 <- getLine
  s2 <- getLine
  
  putStrLn s0
  putStrLn s1
  putStrLn s2