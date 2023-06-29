# [ 例2 ] for 文を使う場合（普段使わない）
n = gets.to_i

names = []
# n 回の繰り返し処理
for _ in 1..n
  names.push(gets.chomp)
end

p names
# > ["taro", "jiro", "hanako"]
