// 2 次元上のいもす法 5 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step5

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
  for (let [sx, sy, lx, ly] of requests) {
    a[sy - 1][sx - 1]++;
    a[sy - 1][lx]--;
    a[ly][sx - 1]--;
    a[ly][lx]++;
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
