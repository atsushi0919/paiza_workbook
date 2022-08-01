# 入力
n, q = gets.split.map(&:to_i)
a = n.times.map { gets.to_i }.tally
k = q.times.map { gets.to_i }

# 検索
results = []
k.each { |target| results <<= a[target] ? "YES" : "NO" }

# 出力
puts results.join("\n")
