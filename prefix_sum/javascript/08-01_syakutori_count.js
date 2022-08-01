// 区間の数え上げ 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__syakutori_count_step1

const k = 15;
const a = [1, 5, 9, 1, 20, 5, 3, 6, 5, 4];

let count = 0;
for (let l = 0; l < a.length; l++) {
  let r = l + 1;
  let sectionSum = 0;
  while (r < a.length + 1) {
    sectionSum += a[r - 1];
    if (sectionSum > k) break;
    r++;
  }
  count += r - l - 1;
}
console.log(count);
