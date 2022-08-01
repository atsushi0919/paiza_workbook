// 区間内の個数 (文字列) 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step1

const left = 2;
const right = 7;
const str = 'bwbwwbwbwb';
const b = str.split('').map((c) => {
  return c === 'b' ? 1 : 0;
});

const s = [0];
for (let e of b) {
  s.push(s[s.length - 1] + e);
}
console.log(s[right + 1] - s[left]);
