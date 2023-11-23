# 【区間内の個数】区間内の個数 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_boss

INPUT1 = <<"EOS"
10 2 7
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
8 1 3
1 3 8 3 1 8 8 1
EOS
OUTPUT2 = <<"EOS"
1
EOS

def solve(input_str)
  # 入力
  _, x, y, *a = input_str.split.map(&:to_i)

  # 累積和 (偶数: 1, 奇数: 0)
  s = [0]
  a.each { |num| s << s[-1] + (num.even? ? 1 : 0) }

  # a[x] ~ a[y] 区間の偶数の数を返す
  s[y + 1] - s[x]
end

puts solve($stdin.read)
