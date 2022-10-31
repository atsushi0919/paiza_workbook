-- 【半角スペース区切りでの文字列の分割】5 つの文字列の半角スペース区切りでの分割 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_string_boss

main :: IO ()
main = do
  let inputStr = "one two three four five"
  let splittedWords = words inputStr

  putStrLn $ unlines splittedWords
