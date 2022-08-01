// 連続する N 個の和の最大値 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step1

const a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4];

let maxSum = 0;
const s = [0];
a.forEach((e, i) => {
  s.push(s[s.length - 1] + e);
  // 2個前の数字 + 1個前の数字 + 今の数字を計算
  if (i >= 2) {
    // 今の数字までの区間合計
    const right = s[i + 1];
    // 2個前の数字より前の区間合計
    const left = s[i - 2];
    // 区間合計が最大なら更新
    maxSum = Math.max(maxSum, right - left);
  }
});
console.log(maxSum);
