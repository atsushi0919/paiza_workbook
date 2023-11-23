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
max_val = -1
s = Array.new (h + 1) { Array.new(w + 1, 0) }
(0...n).each do |y|
  (0...n).each do |x|
    s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
    max_val = [max_val, s[y + 1][x + 1]].max
  end
end

# s の最大値を出力
puts max_val

=begin
const n = 5;
const q = [
  [1, 1, 3, 3],
  [2, 2, 4, 4],
  [3, 3, 5, 5],
  [1, 3, 3, 5],
  [3, 1, 5, 3],
];
const init2DAry = (h, w, v = 0) => {
  return Array.from(new Array(h), () => new Array(w).fill(v));
};

const a = init2DAry(n + 1, n + 1);
for (let [sx, sy, gx, gy] of q) {
  a[sy - 1][sx - 1]++;
  a[sy - 1][gx]--;
  a[gy][sx - 1]--;
  a[gy][gx]++;
}

let maxVal = -1;
const s = init2DAry(n + 1, n + 1);
for (let y = 0; y < n; y++) {
  for (let x = 0; x < n; x++) {
    s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x];
    maxVal = Math.max(maxVal, s[y + 1][x + 1]);
  }
}
console.log(maxVal);
=end
