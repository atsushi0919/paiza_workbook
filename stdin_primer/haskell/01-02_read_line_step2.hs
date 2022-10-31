-- 2 行の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step2

-- INPUT
-- paiza
-- gino

-- OUTPUT1
-- paiza
-- gino

-- INPUT2
-- heisei31
-- reiwa1

-- OUTPUT2
-- heisei31
-- reiwa1

-- INPUT3
-- 2012021300
-- 2020042218

-- OUTPUT3
-- 2012021300
-- 2020042218

main :: IO ()
main = do
  s0 <- getLine
  s1 <- getLine
  
  putStrLn s0
  putStrLn s1