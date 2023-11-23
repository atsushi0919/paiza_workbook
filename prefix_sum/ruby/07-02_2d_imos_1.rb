# 2 次元上のいもす法 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step2

INPUT1 = <<"EOS"
1 3
2 4
3 5
1 3
3 5
EOS
OUTPUT1 = <<"EOS"
5
EOS

# 入力
h = w = 5
sy = gy = 3
ab = INPUT1.split("\n").map { |l| l.split.map(&:to_i) }
# ab = $stdin.read.split("\n").map { |l| l.split.map(&:to_i) }

# 0 で初期化された要素数 h+1, w+1 の二次元配列 a
a = Array.new (h + 1) { Array.new(w + 1, 0) }
# 入口出口で加減算
ab.each do |sx, gx|
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
  const n = 5;
  const y = 3;
  const init2DAry = (h, w, v = 0) => {
    return Array.from(new Array(h), () => new Array(w).fill(v));
  };
  const requests = lines.map((line) => {
    return line.split(' ').map((e) => {
      return parseInt(e, 10);
    });
  });

  const a = init2DAry(n + 1, n + 1);
  for (let [sx, gx] of requests) {
    a[y - 1][sx - 1]++;
    a[y - 1][gx]--;
    a[y][sx - 1]--;
    a[y][gx]++;
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
});

下記の問題をプログラミングしてみよう！
1 行目に a_i, b_i (1 ≦ i ≦ 5) が 5 行で与えられます。

5 行 5 列のマスがあり、最初、マスには全て 0 が書かれています。

5 つの長方形領域の左上の座標 (a_i, 3) と右下の座標 (b_i, 3) が与えられます。それぞれの範囲に対して、その範囲に含まれるマスに 1 を加算していきます。

5 行 5 列のマスに書かれた値のうち、最大の値をいもす法を用いて求めてください。

入力される値
1 行目に a_i, b_i (1 ≦ i ≦ 5) が 5 行で与えられます。



a_1 b_1
a_2 b_2
...
a_5 b_5

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
5 行 5 列のマスに書かれた値のうち、最大の値をいもす法を用いて求めてください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ a_i ≦ b_i ≦ 5 (1 ≦ i ≦ 5)

入力例1
1 3
2 4
3 5
1 3
3 5

出力例1
5
=end
