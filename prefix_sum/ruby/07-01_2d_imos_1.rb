# 2 次元上のいもす法 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step1

# 入力
h = w = 5
q = [
  [1, 1, 3, 3],
  [2, 2, 4, 4],
  [3, 3, 5, 5],
  [1, 3, 3, 5],
  [3, 1, 5, 3],
]

# 0 で初期化された要素数 h+1, w+1 の二次元配列 a
a = Array.new (h + 1) { Array.new(w + 1, 0) }
# 入口出口で加減算
q.each do |sx, sy, gx, gy|
  a[sy - 1][sx - 1] += 1
  a[sy - 1][gx] -= 1
  a[gy][sx - 1] -= 1
  a[gy][gx] += 1
end

# 二次元の累積和
s = Array.new (h) { Array.new(w, 0) }
# 横方向の累積和
(0...h).each do |y|
  (0...w).each do |x|
    s[y][x] = if x == 0
        a[y][x]
      else
        s[y][x - 1] + a[y][x]
      end
  end
end
# 縦方向の累積和
(1...h).each do |y|
  (0...w).each do |x|
    s[y][x] += s[y - 1][x]
  end
end

# s の最大値を出力
puts s.flatten.max
