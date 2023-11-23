# 【区間の和】 区間の和 4 (paizaランク C 相当)
#  https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_boss

INPUT1 = <<"EOS"
10 2 7
1 2 3 4 5 6 7 8 9 10
EOS

OUTPUT1 = <<"EOS"
33
EOS

INPUT2 = <<"EOS"
8 1 3
1 3 8 3 1 8 8 1
EOS

OUTPUT2 = <<"EOS"
14
EOS

def solve(input_str)
  # 入力
  _, x, y, *a = input_str.split.map(&:to_i)

  # 累積和
  s = [0]
  a.each { |num| s << s[-1] + num }

  # a[x] から a[y] までの区間和を返す
  s[y + 1] - s[x]
end

puts solve($stdin.read)
