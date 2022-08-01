// 2変数の最大最小 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_minmax_step0

function solve(inputStr) {
  let [a, b] = inputStr.split(' ').map((str) => parseInt(str));
  if (a < b) {
    [a, b] = [b, a];
  }
  return [a, b].join(' ');
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = '-11 10';
console.log(solve(inputStr));

// 入力例1
// -11 10

// 出力例1
// 10 -11
