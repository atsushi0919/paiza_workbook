# 【1 次元上のいもす法】1 次元上のいもす法 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__1d_imos_boss

INPUT1 = <<"EOS"
10 5
1 3
1 8
3 8
3 6
7 9
EOS
OUTPUT1 = <<"EOS"
4
EOS

INPUT2 = <<"EOS"
8 3
1 7
3 6
4 5
EOS
OUTPUT2 = <<"EOS"
3
EOS

# 入力
(n, _), *lr = INPUT2.split("\n").map { |l| l.split.map(&:to_i) }
# (n, _), *lr = $stdin.read.split("\n").map { |l| l.split.map(&:to_i) }

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
process.stdin.resume();
process.stdin.setEncoding('utf8');

const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
});
reader.on('line', (line) => {
  lines.push(line);
});

reader.on('close', () => {
  const toIntAry = (str) => {
    return str.split(' ').map((str) => parseInt(str, 10));
  };
  const [n, _] = toIntAry(lines.shift());
  const requests = lines.map((line) => {
    return toIntAry(line);
  });

  const a = new Array(n + 1).fill(0);
  for (const [i, o] of requests) {
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
});
=end
