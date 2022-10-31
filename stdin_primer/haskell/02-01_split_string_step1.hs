-- 2 つの文字列の半角スペース区切りでの分割 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_string_step1

main :: IO ()
main = do
  let inputStr = "Hello paiza"
  let splittedWords = words inputStr

  putStrLn $ head splittedWords
  putStrLn $ last splittedWords
