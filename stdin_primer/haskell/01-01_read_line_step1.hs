-- 1 行の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step1

-- 入出力例
-- INPUT1
-- paiza

-- OUTPUT1
-- paiza

-- INPUT2
-- Paiza21

-- OUTPUT2
-- Paiza21

-- INPUT3
-- paiza813

-- OUTPUT3
-- paiza813

-- getLine :: IO String
-- putStrLn :: String -> IO ()

main :: IO()
main = do
  s <- getLine
  
  putStrLn s
