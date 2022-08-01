// 【二次元累積和】 二次元累積和 7 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_boss2

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
  const [h, w, q] = toIntAry(lines.shift());
  const a = lines.slice(0, h).map((line) => {
    return toIntAry(line);
  });
  const requests = lines.slice(-q).map((line) => {
    return toIntAry(line);
  });

  const s = Array.from(new Array(h + 1), () => new Array(w + 1).fill(0));
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x];
    }
  }

  for (let [sy, sx, ly, lx] of requests) {
    let sectionSum = s[ly + 1][lx + 1] - s[sy][lx + 1] - s[ly + 1][sx] + s[sy][sx];
    console.log(sectionSum);
  }
});
