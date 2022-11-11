# 本の整理 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/book_sort

INPUT1 = <<~"EOS"
  5
  5 4 3 2 1
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  10
  8 7 9 1 5 6 2 10 4 3
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

def solve1(input_lines)
  n, *a = input_lines.split.map(&:to_i)

  count = 0
  # 棚の左端から右に向かって調査していく
  0.upto(n - 2) do |i|
    # index: i の棚には 本ID: i + 1 の本を置く
    s_id = i + 1

    # 調査中の棚にある本が正しければ次の棚を調べる
    next if a[i] == s_id

    # 調査中の棚より右側から index: i に置く本を探す
    (i + 1).upto(n - 1) do |j|
      # index: i に置く本 a[j] を発見したとき
      if a[j] == s_id
        # a[i] にある本と a[j] にある本を入れ替え
        a[i], a[j] = a[j], a[i]
        # カウントアップして j のループを抜ける
        count += 1
        break
      end
    end
  end
  count
end

def solve2(input_lines)
  n, *a = input_lines.split.map(&:to_i)

  # key: 本のID-1, value: 今ある場所
  b = a.each_with_index.to_h

  count = 0
  # 棚の左端から s_id: 1 ~ s_id: n として
  # s_id と 本ID が揃うように並べ替える
  0.upto(n - 1) do |i|
    # s_id: 棚ID
    s_id = i + 1

    # 調査中の棚にある本が正しければ次の棚を調べる
    next if a[i] == s_id

    # tmp_p: 正しい本がある場所
    tmp_p = b[s_id]
    # tmp_i: 調査中の棚に置かれている本のID
    tmp_i = a[i]

    # 本の情報を入れ替える
    a[i], a[tmp_p] = a[tmp_p], a[i]
    b[s_id], b[tmp_i] = b[tmp_i], b[s_id]
    count += 1
  end
  count.to_s << "\n"
end

def solve3(input_lines)
  n, *a = input_lines.split.map(&:to_i)

  # b[index(本ID - 1)] に 現在位置を格納
  b = Array.new(n)
  a.each_with_index { |ai, i| b[ai - 1] = i }
  p b

  count = 0
  # 棚の左端から右に向かって調査していく
  a.each_with_index do |ai, i|
    # ai: 現在の本ID, i+1: 入るべき本ID
    # 調査中の棚にある本が正しければ次の棚を調べる
    next if ai == i + 1

    # tmp_p: 正しい本がある場所
    tmp_p = b[i]
    # tmp_i: 調査中の棚に置かれている本のindex
    tmp_i = a[i] - 1

    # 本の情報を入れ替える
    a[i], a[tmp_p] = a[tmp_p], a[i]
    b[i], b[tmp_i] = b[tmp_i], b[i]

    count += 1
  end
  count
end

puts solve2(STDIN.read)
