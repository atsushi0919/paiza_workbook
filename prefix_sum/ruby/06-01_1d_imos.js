// 1 次元上のいもす法 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__1d_imos_step1

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
