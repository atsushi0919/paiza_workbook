-- 3 つの文字列の半角スペース区切りでの分割 (paizaランク D 相当)
-- https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_string_step2

main :: IO()
main = do
  let inputStr = "He likes paiza"
  let splittedWords = words inputStr

  putStrLn $ splittedWords !! 0
  putStrLn $ splittedWords !! 1
  putStrLn $ splittedWords !! 2
