// 【特殊な探索】 成績優秀者の列挙 2 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_boss

function solve(inputStr) {
  let array = inputStr.trim().split('\n');
  let n = parseInt(array.shift());
  let [k, l] = array
    .pop()
    .split(' ')
    .map((e) => {
      return parseInt(e);
    });
  let result = [];

  array.forEach((testResult) => {
    let [name, score] = testResult.split(' ');
    if (k <= parseInt(score) && parseInt(score) <= l) {
      result.push(name);
    }
  });

  return result.join('\n');
}

// const inputStr = require('fs').readFileSync('/dev/stdin', 'utf8');
// console.log(solve(inputStr));

const inputStr = `
5
alice 97
bob 25
carol 57
dave 46
ellen 10
35 80
`;

console.log(solve(inputStr));

// 入力例1
// 5
// alice 97
// bob 25
// carol 57
// dave 46
// ellen 10
// 35 80

// 出力例1
// carol
// dave
