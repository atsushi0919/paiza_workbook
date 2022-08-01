// 区間の和 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step2

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
  const left = 2;
  const right = 7;
  const ary = lines
    .shift()
    .split(' ')
    .map((str) => parseInt(str, 10));
  const prefixSum = [0];
  for (const num of ary) {
    prefixSum.push(prefixSum.slice(-1)[0] + num);
  }
  const sectionSum = prefixSum[right + 1] - prefixSum[left];
  console.log(sectionSum);
});
