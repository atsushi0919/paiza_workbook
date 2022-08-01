# ソート (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_sort_boss

INPUT1 = <<~"EOS"
  2
  2 1
  1 2
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 1
EOS

INPUT2 = <<~"EOS"
  4
  2 3
  0 4
  5 0
  3 3
EOS
OUTPUT2 = <<~"EOS"
  0 4
  3 3
  2 3
  5 0
EOS

def solve(input_lines)
  # 入力受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map do |line|
    line.split.map(&:to_i)
  end

  # 銀の降順で金の降順に並び替える
  sorted_ary = []
  ary.each do |t_g, t_s|
    inserted = false
    sorted_ary.each_with_index do |item, idx|
      a_g, a_s = item
      if t_s > a_s || t_s == a_s && t_g > a_g
        sorted_ary.insert(idx, [t_g, t_s])
        inserted = true
        break
      end
    end
    sorted_ary << [t_g, t_s] if not inserted
  end

  # 行を改行で連結、行の要素を半角スペースで連結にして末尾に改行を追加
  sorted_ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

# 確認用コード
p solve(INPUT1)
# > "1 2\n2 1\n"
p solve(INPUT1) == OUTPUT1
# > true
p solve(INPUT2)
# > "0 4\n3 3\n2 3\n5 0\n"
p solve(INPUT2) == OUTPUT2
# > true

exit

=begin
def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map { |line| line.split.map(&:to_i) }
  ary.sort_by! { |x| [x[1], x[0]] }.reverse!
  ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

puts solve(STDIN.read)
=end

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i

  ary = []
  input_lines.shift(n).each do |line|
    t_g, t_s = line.split.map(&:to_i)
    inserted = false
    ary.each_with_index do |items, idx|
      a_g, a_s = items
      if t_s > a_s || t_s == a_s && t_g > a_g
        ary.insert(idx, [t_g, t_s])
        inserted = true
        break
      end
    end
    ary << [t_g, t_s] if not inserted
  end
  ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

puts solve()

=begin
n = gets.to_i
ary = []
n.times do
  t_a, t_b = gets.split.map(&:to_i)
  inserted = false
  ary.each_with_index do |tmp, idx|
    a_a, a_b = tmp
    if a_a < t_a || a_a == t_a && a_b < t_b
      ary.insert(idx, [t_a, t_b])
      inserted = true
      break
    end
  end
  ary << [t_a, t_b] if not inserted
end
p ary
=end

=begin
N 人の人々がおり、それぞれの人は金と銀を何キログラムか持っています。
今は金の方が銀よりも価値が高いですが、ある日金と銀の価値が逆転して、
人々の財産の多さは次のように決定されるようになりました。

1. 持っている銀が多い方が財産が多い。
2. 持っている銀が同じなら、持っている金が多い方が財産が多い。

それぞれの人が持っている金と銀のキログラム数が与えられるので、この規則にしたがって、財産を多い順に並び替えて出力してください。

入力される値
入力は以下のフォーマットで与えられます。

N
g_1 s_1
...
g_N s_N

1 行目には人々の数を表す整数 N が与えられ、 2 行目から (N + 1) 行目には、人々が持っている金の量 g_i と銀の量 s_i がそれぞれ半角スペース区切りで N 行与えられます （1 ≤ i ≤ N）。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
上の規則に従って人々の財産を並び替え、入力と同じ形式で、各 g_i, s_i を半角スペース区切りで、財産が多い順に N 行出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≤ N ≤ 50
・0 ≤ g_i, s_i ≤ 50（1 ≤ i ≤ N）

INPUT1 = <<~"EOS"
2
2 1
1 2

OUTPUT1 = <<~"EOS"
1 2
2 1

INPUT2 = <<~"EOS"
4
2 3
0 4
5 0
3 3

OUTPUT2 = <<~"EOS"
0 4
3 3
2 3
5 0
=end
