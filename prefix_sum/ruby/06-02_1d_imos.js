// 1 次元上のいもす法 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__1d_imos_step2

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
  const n = 10;
  const q = lines.map((line) => {
    return line.split(' ').map((e) => {
      return parseInt(e, 10);
    });
  });

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
});
