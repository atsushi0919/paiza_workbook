// 指定された値の位置 1 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_step1

function solve(inputStr) {
  let [, array, num] = inputStr.trim().split('\n');
  array = array.split(' ');

  let index = array.indexOf(num) + 1;

  return index;
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
-3 2 0 -1 2
2
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -3 2 0 -1 2
// 2

// 出力例1
// 2
