// 2番目に大きな値 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_kthmax_step0

function solve(inputStr) {
  let [, array] = inputStr.trim().split('\n');
  array = array.split(' ').map((num) => parseInt(num));
  let k = 2;

  return array.sort((a, b) => b - a)[k - 1];
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
-9 10 6 0 -3
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -9 10 6 0 -3

// 出力例1
// 6
