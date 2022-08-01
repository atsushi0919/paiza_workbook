// 区間内の個数 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step1

const left = 2;
const right = 7;
const a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4];
const b = a.map((e) => {
  return e % 2 === 0 ? 1 : 0;
});

const s = [0];
for (let e of b) {
  s.push(s[s.length - 1] + e);
}
console.log(s[right + 1] - s[left]);
