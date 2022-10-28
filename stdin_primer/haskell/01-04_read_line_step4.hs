-- 10 行の入力 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step4


-- getContents :: IO String
-- lines :: String -> [String]
-- unlines :: [String] -> String

main :: IO()
main = do
  inputStr <- getContents  -- "ak\nbl\ncm\ndn\neo\nfp\ngq\nhr\nis\njt\n"
  let inputLines = lines inputStr  -- ["ak","bl","cm","dn","eo","fp","gq","hr","is","jt"]
  let outputStr = unlines inputLines  -- "ak\nbl\ncm\ndn\neo\nfp\ngq\nhr\nis\njt\n"
  
  putStrLn outputStr 
