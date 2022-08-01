// 長方形に含まれる点 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step5

function isInRange(num, min, max) {
  return min <= num && num <= max;
}

function solve(inputStr) {
  let array = inputStr.trim().split('\n');
  let n = parseInt(array.shift());
  array = array.map((point) => {
    return point.split(' ').map((num) => {
      return parseInt(num);
    });
  });
  let [x, y] = array.splice(-2, 2);
  let count = 0;

  for (let i = 0; i < n; i++) {
    if (isInRange(array[i][0], ...x) && isInRange(array[i][1], ...y)) {
      count++;
    }
  }
  return count;
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
-9 5
0 4
2 -6
7 -4
-3 -1
-5 5
-5 5
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -9 5
// 0 4
// 2 -6
// 7 -4
// -3 -1
// -5 5
// -5 5

// 出力例1
// 2
