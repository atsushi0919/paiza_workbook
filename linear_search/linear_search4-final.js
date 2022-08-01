// 【第 k 要素の探索】k番目に大きな値 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_kthmax_boss

function solve(inputStr) {
  let [, array, k] = inputStr.trim().split('\n');
  array = array.split(' ').map((num) => parseInt(num));

  return array.sort((a, b) => b - a)[parseInt(k) - 1];
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
-9 10 6 0 -3
4
`;

console.log(solve(inputStr));

// 入力例1
// 5
// -9 10 6 0 -3
// 4

// 出力例1
// -3
