// 二次元累積和 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__2dsection_sum_step1

const sy = 1,
  sx = 1,
  ly = 3,
  lx = 3;
const h = 5,
  w = 5;
const a = [
  [1, 2, 3, 4, 5],
  [2, 3, 4, 5, 6],
  [3, 4, 5, 6, 7],
  [4, 5, 6, 7, 8],
  [5, 6, 7, 8, 9],
];

const s = Array.from(new Array(h + 1), () => new Array(w + 1).fill(0));
for (let y = 0; y < h; y++) {
  for (let x = 0; x < w; x++) {
    s[y + 1][x + 1] = a[y][x] + s[y][x + 1] + s[y + 1][x] - s[y][x];
  }
}

// a[1][1], a[3][3] 領域の和を求める
// a[0][0], a[3][3] 領域の和 => s[4][4]: 64
// a[0][0], a[0][4] 領域の和 => s[1][5]: 10
// a[0][0], a[4][0] 領域の和 => s[5][1]: 10
// a[0][0], a[0][0] 領域の和 => s[1][1]: 1
// s[4][4] - s[1][4] - s[4][1] + s[1][1]
// 64 - 10 - 10 + 1 = 45
let sectionSum = s[ly + 1][lx + 1] - s[sy][lx + 1] - s[ly + 1][sx] + s[sy][sx];
console.log(sectionSum);
