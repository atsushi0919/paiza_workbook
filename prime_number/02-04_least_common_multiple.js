// 最小公倍数 (paizaランク C 相当)
// https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__least_common_multiple

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
  lines.shift();
  let a = lines.map((e) => {
    return parseInt(e, 10);
  });

  // 素因数分解
  const allDivs = [];
  const divsList = a.map((n) => {
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
    allDivs.push(Object.keys(divs));
    return divs;
  });

  // 最小公倍数
  let lcm = 1;
  for (const k of [...new Set(allDivs.flat())]) {
    let maxMpr = 0;
    for (const divs of divsList) {
      maxMpr = Math.max(maxMpr, divs[k] || 0);
    }
    lcm *= k ** maxMpr;
  }
  console.log(lcm);
});
