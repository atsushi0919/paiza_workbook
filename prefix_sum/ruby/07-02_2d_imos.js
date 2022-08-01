// 2 次元上のいもす法 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step2

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
  for (let [sx, lx] of requests) {
    a[y - 1][sx - 1]++;
    a[y - 1][lx]--;
    a[y][sx - 1]--;
    a[y][lx]++;
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
