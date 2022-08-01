// 約数の個数 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__number_of_divisor

process.stdin.resume();
process.stdin.setEncoding('utf8');

const lines = [];
const reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
});
reader.on('line', (line) => {
  lines.push(line);
});
reader.on('close', () => {
  let n = parseInt(lines.shift(), 10);

  const divs = {};
  let div = 2;
  while (n > 1) {
    if (n % div > 0) {
      div++;
      continue;
    }
    divs[div] = (divs[div] || 0) + 1;
    n /= div;
  }

  let numOfDivs = 1;
  Object.keys(divs).forEach((k) => {
    numOfDivs *= divs[k] + 1;
  });
  console.log(numOfDivs);
});
