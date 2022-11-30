// 素因数分解 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__prime_factorization

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

  const divs = [];
  let div = 2;
  while (n > 1) {
    if (n % div > 0) {
      div++;
      continue;
    }
    divs.push(div);
    n /= div;
  }
  console.log(divs.join('\n'));
});
