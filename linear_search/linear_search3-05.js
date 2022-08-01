// 点と点の距離 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step4

function manhattanDistance(a, b) {
  return Math.abs(a[0] - b[0]) + Math.abs(a[1] - b[1]);
}

function solve(inputStr) {
  let array = inputStr.trim().split('\n');
  let n = parseInt(array.shift());
  let k = parseInt(array.pop());
  let count = 0;
  array = array.map((point) => {
    return point.split(' ').map((num) => {
      return parseInt(num);
    });
  });

  for (i = 0; i < n; i++) {
    if (manhattanDistance(array[i], array[n - 1]) <= k) {
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
10
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -9 5
// 0 4
// 2 -6
// 7 -4
// -3 -1
// 10

// 出力例1
// 3
