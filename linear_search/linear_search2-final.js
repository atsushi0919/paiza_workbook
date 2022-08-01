// 【最大最小】n 変数の最大最小 (paizaランク C 相当)
//  https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_minmax_boss

function solve(inputStr) {
  let [, array] = inputStr.trim().split('\n');
  array = array.split(' ').map((str) => parseInt(str));
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

const inputStr = `
5
10 -19 14 8 -90
`;

console.log(solve(inputStr));

// 入力例1
// 5
// 10 -19 14 8 -90

// 出力例1
// 14 -90
