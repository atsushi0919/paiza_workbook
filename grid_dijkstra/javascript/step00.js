// https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d0

class Board {
  constructor(h, w, pos, cost) {
    this.dy = [-1, 0, 1, 0]
    this.dx = [0, 1, 0, -1]
    this.d_index = ['U', 'R', 'D', 'L']
    this.h = h
    this.w = w
    this.pos = pos
    this.cost = cost
  }

  calcCost(directions) {
    let total_cost = 0
    let pos = Object.assign({}, this.pos)
    directions.forEach((direction) => {
      let index = this.d_index.indexOf(direction)
      pos.y += this.dy[index]
      pos.x += this.dx[index]
      total_cost += this.cost[pos.y][pos.x]
    })
    return total_cost
  }
}

function solve(lines) {
  const pos = { y: 0, x: 0 }
  const directions = ['R', 'D', 'R', 'U', 'L']
  let h, w
  ;[h, w] = lines
    .shift()
    .split(' ')
    .map((str_val) => parseInt(str_val))
  let cost = lines.map((line) => {
    return line.split(' ').map((str_val) => parseInt(str_val))
  })

  let board = new Board(h, w, pos, cost)
  console.log(board.calcCost(directions))
}

/*
let input_lines = [];
let reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.on('line', (line) => {
  input_lines.push(line);
});
reader.on('close', () => {
  solve(input_lines);
});
*/

const q1 = ['2 5', '0 1 2 3 4', '5 6 7 8 9']
solve(q1)

/*
グリッド状の盤面の左上からスタートして、「右、下、右、上、左」と順に移動したときの経路上のマスのコストの合計を求めてください。

経路上のマスには、スタートとゴールのマスも含むものとします。

※この問題は、paiza開発日誌で詳しく解説しています

▼　下記解答欄にコードを記入してみよう

入力される値
h w
t_{0,0} t_{0,1} ... t_{0,w-1}
t_{1,0} t_{1,1} ... t_{1,w-1}
...
t_{h-1,0} t_{h-1,1} ... t_{h-1,w-1}


・1 行目には盤面の行数を表す h , 盤面の列数を表す w が与えられます。
・続く h 行の各行では i 行目 (0 ≦ i < h) には、盤面が与えられます。
・t_{i,j} は i 行目の j 列目のコストです。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
コストの合計を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ h , w ≦ 20
・1 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
2 5
0 1 2 3 4
5 6 7 8 9

出力例1
17
*/
