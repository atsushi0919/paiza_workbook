# 雪だるま作り (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/snowman_making

INPUT1 = <<~"EOS"
  6 8
  4 6 5 1 5 3
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  10 59
  22 29 11 41 42 33 9 27 17 13
EOS
OUTPUT2 = <<~"EOS"
  3
EOS

def solve1(input_str)
  # 入力受け取り
  n, k, *snow_balls = input_str.split.map(&:to_i)

  # 雪玉を昇順ソート
  snow_balls.sort!

  count = 0
  # 雪玉が2個以上ある間ループ
  while snow_balls.length > 1
    # 最大径の雪玉を取り出し body とする
    body = snow_balls.pop

    # 最小径から順に取り出すループ
    while not snow_balls.empty?
      # 最小径の雪玉を取り出し head とする
      head = snow_balls.shift
      # 高さが k 以上か？
      if head + body >= k
        # count を +1
        count += 1
        # 最小径の雪玉を取り出すループを抜ける
        break
      end
    end
  end
  # 雪だるまの数を文字列に変換して末尾に改行を追加
  count.to_s << "\n"
end

def solve2(input_str)
  # 入力受け取り
  n, k, *snow_balls = input_str.split.map(&:to_i)

  # 雪玉を昇順ソート
  snow_balls.sort!

  count = 0
  # 雪玉が2個以上ある間繰り返す
  while snow_balls.length > 1
    # 最大径の雪玉を取り出し body とする
    body = snow_balls.pop
    # 高さが k 以上になる雪玉のうち最小径の index を返す
    idx = snow_balls.bsearch_index { |head| head + body >= k }
    # nil が帰ってきたら雪だるまは作れない
    break if idx.nil?

    # count を +1
    count += 1
    # 今回使用した雪玉の次に大きい雪玉を最小径とする
    snow_balls = snow_balls[idx + 1..]
  end

  # 雪だるまの数を文字列に変換して末尾に改行を追加
  count.to_s << "\n"
end

puts solve1(STDIN.read)
