// 区間の和 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step1

const ary = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4];
const left = 2;
const right = 7;

const prefixSum = [0];
for (const num of ary) {
  prefixSum.push(prefixSum.slice(-1)[0] + num);
  // ↕ 同じ動作
  // prefixSum.push(prefixSum[prefixSum.length - 1] + num);
}
const sectionSum = prefixSum[right + 1] - prefixSum[left];
console.log(sectionSum);
