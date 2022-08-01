// 奇数の探索 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step1

function solve(inputStr) {
  let [n, array] = inputStr.trim().split('\n');
  array = array.split(' ').map((str) => parseInt(str));

  let oddIndex;
  for (let i = 0; i < n; i++) {
    if (array[i] % 2 != 0) {
      oddIndex = i + 1;
    }
  }

  return oddIndex;
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
1 3 5 6 8
`;

console.log(solve(inputStr));

// 入力例1
// 5
// 1 3 5 6 8

// 出力例1
// 3
