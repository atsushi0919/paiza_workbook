// 【区間の和】 区間の和 4 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_boss

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
  const toIntAry = (str) => {
    return str.split(' ').map((str) => parseInt(str, 10));
  };
  const [_, left, right] = toIntAry(lines.shift());
  const ary = toIntAry(lines.shift());

  const prefixSum = [0];
  for (let num of ary) {
    prefixSum.push(prefixSum.slice(-1)[0] + num);
  }
  const sectionSum = prefixSum[right + 1] - prefixSum[left];
  console.log(sectionSum);
});
