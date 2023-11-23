# 1 次元上のいもす法 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__1d_imos_step1

# 入力
n = 10
lr = [[1, 3], [1, 8], [3, 8], [3, 6], [7, 9]]

# 0 で初期化された要素数 n+1 の配列 a
a = Array.new(n + 1, 0)
# 入口出口で加減算
lr.each do |l, r|
  a[l - 1] += 1
  a[r] -= 1
end

# 累積和
s = [a[0]]
max_val = -1
1.upto(n - 1) do |i|
  s[i] = s[i - 1] + a[i]
  max_val = [max_val, s[i]].max
end

# s の最大値を出力
puts max_val

=begin
0 で初期化された要素数n=10 の配列a があります。
q=5 個の範囲 [[1, 3], [1, 8], [3, 8], [3, 6], [7, 9]]が与えられ、
それぞれの範囲に対して、その範囲に含まれるマスに 1 を加算していきます。
すべての加算が終わった時点での要素の最大値を出力する問題です。

const n = 10;
const q = [
  [1, 3],
  [1, 8],
  [3, 8],
  [3, 6],
  [7, 9],
];

const a = new Array(n + 1).fill(0);
for (const [i, o] of q) {
  a[i - 1]++;
  a[o]--;
}

let maxVal = -1;
const s = new Array(n + 1).fill(0);
for (let i = 0; i < n; i++) {
  s[i + 1] = s[i] + a[i];
  maxVal = Math.max(maxVal, s[i + 1]);
}
console.log(maxVal);
=end
