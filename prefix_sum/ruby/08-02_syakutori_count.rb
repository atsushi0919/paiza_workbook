# 区間の数え上げ 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__syakutori_count_step2

=begin
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
  const k = 15;
  const a = lines
    .shift()
    .split(' ')
    .map((str) => {
      return parseInt(str, 10);
    });

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
});
=end