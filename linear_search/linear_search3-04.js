// 条件付き最大値 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step3

function solve(inputStr) {
  let [n, array, k] = inputStr.trim().split('\n');
  array = array.split(' ').map((str) => parseInt(str));
  let maxNum = -Infinity;

  array.forEach((number) => {
    if (number <= k) {
      maxNum = Math.max(number, maxNum);
    }
  });

  return maxNum;
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
-5 11 3 -9 0
-4
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -5 11 3 -9 0
// -4

// 出力例1
// -5
