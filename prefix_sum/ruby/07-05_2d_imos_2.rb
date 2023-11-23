# 2 次元上のいもす法 5 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step5

INPUT1 = <<"EOS"
5 5
1 1 3 3
2 2 4 4
3 3 5 5
1 3 3 5
3 1 5 3
EOS
OUTPUT1 = <<"EOS"
5
EOS

INPUT2 = <<"EOS"
3 3
1 1 2 2
2 2 2 2
2 2 3 3
EOS
OUTPUT2 = <<"EOS"
3
EOS

# 入力
(n, _), *abcd = INPUT1.split("\n").map { |l| l.split.map(&:to_i) }
# (n, _), *abcd = $stdin.read.split("\n").map { |l| l.split.map(&:to_i) }

# 0 で初期化された要素数 n+1, n+1 の二次元配列 a
a = Array.new (n + 1) { Array.new(n + 1, 0) }
# 入口出口で加減算
abcd.each do |sx, sy, gx, gy|
  a[sy - 1][sx - 1] += 1
  a[sy - 1][gx] -= 1
  a[gy][sx - 1] -= 1
  a[gy][gx] += 1
end

# 二次元の累積和
max_val = -1
s = Array.new (n + 1) { Array.new(n + 1, 0) }
(0...n).each do |y|
  (0...n).each do |x|
    s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x]
    max_val = [max_val, s[y + 1][x + 1]].max
  end
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
  const init2DAry = (h, w, v = 0) => {
    return Array.from(new Array(h), () => new Array(w).fill(v));
  };
  const [n, _] = toIntAry(lines.shift());
  const requests = lines.map((line) => {
    return toIntAry(line);
  });

  const a = init2DAry(n + 1, n + 1);
  for (let [sx, sy, gx, gy] of requests) {
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
});

2 次元上のいもす法 5 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step5
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
1 行目に整数 N, K が与えられます。

2 行目に a_i, b_i, c_i, d_i (1 ≦ i ≦ K) が K 行で与えられます。

N 行 N 列のマスがあり、最初、マスには全て 0 が書かれています。

K 個の長方形領域の左上の座標 (a_i, b_i) と右下の座標 (c_i, d_i) が与えられます。それぞれの範囲に対して、その範囲に含まれるマスに 1 を加算していきます。

N 行 N 列のマスに書かれた値のうち、最大の値をいもす法を用いて求めてください。

入力される値
1 行目に整数 N, K が与えられます。

2 行目に a_i, b_i, c_i, d_i (1 ≦ i ≦ 5) が 5 行で与えられます。



N K
a_1 b_1 c_1 d_1
a_2 b_2 c_2 d_2
...
a_K b_K c_K d_K

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
N 行 N 列のマスに書かれた値のうち、最大の値をいもす法を用いて求めてください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ N ≦ 10

・ 1 ≦ K ≦ 10

・ 1 ≦ a_i ≦ c_i ≦ N (1 ≦ i ≦ K)

・ 1 ≦ b_i ≦ d_i ≦ N (1 ≦ i ≦ K)

入力例1
5 5
1 1 3 3
2 2 4 4
3 3 5 5
1 3 3 5
3 1 5 3

出力例1
5

入力例2
3 3
1 1 2 2
2 2 2 2
2 2 3 3

出力例2
3
=end
