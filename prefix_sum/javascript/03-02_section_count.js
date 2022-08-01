// 区間内の個数 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_step2

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
  const a = [];
  const b = [];
  for (let e of lines.shift().split(' ')) {
    e = parseInt(e, 10);
    a.push(e);
    b.push(e % 2 === 0 ? 1 : 0);
  }

  const s = [0];
  for (let e of b) {
    s.push(s[s.length - 1] + e);
  }
  console.log(s[right + 1] - s[left]);
});
