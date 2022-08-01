// 【区間の長さ】 区間の長さ 4 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__syakutori_length_boss

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
  const [_, k] = toIntAry(lines.shift());
  const a = toIntAry(lines.shift());

  let maxLength = 0;
  for (let l = 0; l < a.length; l++) {
    let r = l + 1;
    let sectionSum = 0;
    while (r < a.length + 1) {
      sectionSum += a[r - 1];
      if (sectionSum > k) break;
      r++;
    }
    maxLength = Math.max(maxLength, r - l - 1);
  }
  console.log(maxLength);
});
