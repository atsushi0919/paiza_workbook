// 2 次元上のいもす法 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2d_imos_step1

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
for (let [sx, sy, lx, ly] of q) {
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
