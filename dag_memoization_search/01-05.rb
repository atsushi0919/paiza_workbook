# 迷路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step5

INPUT1 = <<"EOS"
3 4 2
2 1
1 3
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
3 4 2
2 1
1 3
EOS
OUTPUT2 = <<"EOS"
3
EOS

DIV = 1_000_000_007     # 割る数
DIR = [[1, 0], [0, 1]]  # 方向設定
# 入力
input_lines = INPUT2.split("\n")
n, m, b = input_lines.shift.split.map(&:to_i)
xy = input_lines.shift(b).map { |r| r.split.map(&:to_i) }

# スタート地点から探索開始
search_list = [[1, 1]]
num_of_paths = 0
while search_list.length > 0
  cx, cy = search_list.pop

  # ゴールに着いたら経路数+1
  if cx == n && cy == m
    num_of_paths += 1
    next
  end

  # 次のマスを調べる
  DIR.each do |dx, dy|
    nx = cx + dx
    ny = cy + dy
    # 次のマスにいけないならスキップ
    next if nx > n || ny > m
    next if xy.include?([nx, ny])

    search_list << [nx, ny]
  end
end

# ゴールに到達可能な経路数を出力
puts num_of_paths

=begin
横 N マス縦 M マスの敷地があり、左から A 番目、上から B 番目のマスは(A, B) と表現します。また、敷地にはブロックが B 個置かれています。
(X_i, Y_i) はブロックがあり、このマスへは移動することができません。
あなたは現在スタート( 1, 1 )におり、ゴール(N, M) へ行こうと考えています。
また、(A, B) から移動できるマスは(A + 1, B) または(A, B + 1 )のみです(当然、ブロックのあるマスへは移動できません)。

スタートからゴールまで行く方法は何通りありますか？答えは非常に大きくなることがあるので、 1,000,000,007 で割ったあまりを出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N M B
X_1 Y_1
X_2 Y_2
...
X_B Y_B


・ 1 行目に、敷地の横のマス数と縦のマス数とブロックの数が空白区切りで与えられます。
・ 2 行目から B + 1 行にかけて、ブロックの位置が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
スタートからゴールまで行く方法は何通りか答えてください。スタートからゴールまで行く方法が存在しない場合は 0 を出力してください。答えは非常に大きくなることがあるので、 1,000,000,007 で割ったあまりを出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N, M ≦ 1,000
・ 0 ≦ B ≦ N + M - 2
・ 1 ≦ X_i ≦ N
・ 1 ≦ Y_i ≦ M
・ (X_i, Y_i) ≠ ( 1, 1 ) かつ (X_i, Y_i) ≠ (N, M)

入力例1
3 4 2
2 1
1 3

出力例1
3

入力例2
3 4 2
2 1
1 3

出力例2
3
=end
