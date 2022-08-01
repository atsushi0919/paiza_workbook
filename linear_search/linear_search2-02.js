// 10変数の最大最小 (paizaランク D 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_minmax_step1

function solve(inputStr) {
  let array = inputStr.split(' ').map((str) => parseInt(str));
  let maxNum = -Infinity;
  let minNum = Infinity;

  array.forEach((number) => {
    maxNum = Math.max(number, maxNum);
    minNum = Math.min(number, minNum);
  });

  return [maxNum, minNum].join(' ');
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = '-11 10 0 9 6 -10 5 3 2 -8';
console.log(solve(inputStr));

// 入力例1
// -11 10 0 9 6 -10 5 3 2 -8

// 出力例1
// 10 -11
