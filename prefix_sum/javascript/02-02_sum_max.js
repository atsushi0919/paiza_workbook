// 連続する N 個の和の最大値 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step2

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
  const ary = lines
    .shift()
    .split(' ')
    .map((str) => parseInt(str, 10));

  const s = [0];
  let maxSum = 0;
  a.forEach((e, i) => {
    s.push(s[s.length - 1] + e);
    // 2個前の数字 + 1個前の数字 + 今の数字を計算
    if (i >= 2) {
      // 今の数字までの区間合計
      const right = s[i + 1];
      // 2個前の数字より前の区間合計
      const left = s[i - 2];
      // 区間合計が最大なら更新
      maxSum = Math.max(maxSum, right - left);
    }
  });
  console.log(maxSum);
});
