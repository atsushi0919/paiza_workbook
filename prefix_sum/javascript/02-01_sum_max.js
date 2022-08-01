// 連続する N 個の和の最大値 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step1

const n = 3;
const ary = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4];

let maxSum = 0;
const prefixSum = [0];
ary.forEach((num, i) => {
  prefixSum.push(prefixSum.slice(-1)[0] + num);
  // 2個前の数字 + 1個前の数字 + 今の数字を計算
  if (i >= n - 1) {
    // 今の数字までの累計和
    const rightPrefixSum = prefixSum[i + 1];
    // n-1 個前の数字より前の累計和
    const leftPrefixSum = prefixSum[i - n - 1];
    // 区間合計が最大なら更新
    const sectionSum = rightPrefixSum - leftPrefixSum;
    maxSectionSum = Math.max(maxSectionSum, sectionSum);
  }
});
console.log(maxSectionSum);
