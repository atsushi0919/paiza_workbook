# 2 * 2 の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step1

# 解答例1
ary = [[0, 8], [1, 3]]
# 出力
ary.each do |row|
  # 1 行毎に半角スペース区切りで出力する
  puts(row.join(" "))
end

# 解答例2
ary = [[0, 8], [1, 3]]
# 出力
puts(ary.map { |row| row.join(" ") })

# 解答例3
w = 2
ary = [0, 8, 1, 3]
# 出力
row = []
# ary の先頭から順に参照する
ary.each do |n|
  # n を row に追加する
  row.push(n)
  # 要素数 w=2 個毎に半角スペース区切りで出力する
  if row.length == w
    puts(row.join(" "))
    row = []
  end
end
