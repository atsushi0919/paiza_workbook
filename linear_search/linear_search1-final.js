// 【指定された値の探索】指定された値の位置 3 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_boss

function solve(inputStr) {
  let [, array, num] = inputStr.trim().split('\n');
  array = array.split(' ');

  let index = array.indexOf(num);
  let result = [];
  while (index != -1) {
    result.push(index + 1);
    index = array.indexOf(num, index + 1);
  }

  return result.join('\n');
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
// 5
