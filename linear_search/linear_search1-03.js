// 指定された値の位置 2 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_step2

function solve(inputStr) {
  let [, array, num] = inputStr.trim().split('\n');
  array = array.split(' ');

  let index = array.indexOf(num);
  let result = [index];
  while (index != -1) {
    result.push(index);
    index = array.indexOf(num, index + 1);
  }

  return result.pop() + 1;
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
