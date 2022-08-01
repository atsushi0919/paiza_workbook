# forループ (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_for_boss

INPUT1 = <<~"EOS"
  3 2 1
  2 2
  1 2
  1 1
EOS
OUTPUT1 = <<~"EOS"
  0
  1
  2
EOS
INPUT2 = <<~"EOS"
  4 5 2
  1 3 4 4 5
  2 2 2 2 2
  1 2 3 4 5
  1 1 1 1 1
EOS
OUTPUT2 = <<~"EOS"
  0
  5
  1
  0
EOS

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, m, k = input_lines.shift.split.map(&:to_i)
  ary = []
  for i in 0...n
    ary << input_lines[i].split.map(&:to_i)
  end

  result = []
  # 参加者を参照するループ
  for n_i in 0...n
    score = 0
    # 書かれた番号を参照するループ
    for m_i in 0...m
      # 書かれた番号が当たりなら score +1
      score += 1 if ary[n_i][m_i] == k
    end
    # 得点を result 末尾に追加
    result << score
  end
  # 処理結果を改行で連結して末尾に改行を加える
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

# [解答例1]
def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, m, k = input_lines.shift.split.map(&:to_i)
  ary = []
  for i in 0...n
    ary << input_lines[i].split.map(&:to_i)
  end

  result = []
  for n_i in 0...n
    score = 0
    for m_i in 0...m
      score += 1 if ary[n_i][m_i] == k
    end
    result << score
  end
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

# [解答例2]
def solve(input_lines)
  input_lines = input_lines.split("\n")
  n, m, k = input_lines.shift.split.map(&:to_i)
  ary = input_lines.shift(n).map do |line|
    line.split.map(&:to_i)
  end

  # 参加者(m個の番号が書かれた紙)を順に参照する
  result = ary.each.map do |member|
    # 得点を計算する
    member.count { |num| num == k }
  end
  # 処理結果を改行で連結して末尾に改行を加える
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

=begin
パイザ君の所属する会社では忘年会の余興で次のようなゲームを行います。
まず、正整数 M が発表され、参加者は手元の紙に M 個、好きな数字を書きます。
このとき、紙に書く数のそれぞれは 1 以上 M 以下であり、同じ数字を何度書いても構いません。
その後、 1 以上 M 以下の数 K が発表され、各参加者は自分の紙に数字 K を書いた数だけポイントをもらい、
ポイントの高い順に景品が配られます。

忘年会の参加者の人数 N と、数 M , K が与えられ、各参加者が書いた紙が与えられるので、それぞれの参加者の得点を計算して出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

N M K
a_{1,1} ... a_{1,M}
...
a_{N,1} ... a_{N,M}

1 行目には上で説明した数 N, M, K が半角スペース区切りで与えられ、 
2 行目から (N + 1) 行目までには各参加者が紙に書いた数字が M 個ずつ半角スペース区切りで、 N 回与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力された通りの順番で、各参加者の得点をN回、改行区切りで出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≤ N , M ≤ 50
・1 ≤ K , a_{i,j} ≤ M（1 ≤ i ≤ N , 1 ≤ j ≤ M）

INPUT1 = <<~"EOS
3 2 1
2 2
1 2
1 1

OUTPUT1 = <<~"EOS
0
1
2

INPUT2 = <<~"EOS
4 5 2
1 3 4 4 5
2 2 2 2 2
1 2 3 4 5
1 1 1 1 1

OUTPUT2 = <<~"EOS
0
5
1
0
=end
