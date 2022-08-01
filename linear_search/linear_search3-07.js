// 成績優秀者の列挙 1 (paizaランク C 相当)
// https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step6

function solve(inputStr) {
  let array = inputStr.trim().split('\n');
  let n = parseInt(array.shift());
  let k = parseInt(array.pop());
  let result = [];

  array.forEach((testResult) => {
    let [name, score] = testResult.split(' ');
    if (parseInt(score) >= k) {
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
35
`;

console.log(solve(inputStr));

// 入力例1
// 5
// alice 97
// bob 25
// carol 57
// dave 46
// ellen 10
// 35

// 出力例1
// alice
// carol
// dave
