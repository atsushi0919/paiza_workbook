# 【連続する N 個の和の最大値】 連続する N 個の和の最大値 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_boss

INPUT1 = <<"EOS"
10 3
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
27
EOS

INPUT2 = <<"EOS"
8 3
13 81 31 83 38 11 33 88
EOS
OUTPUT2 = <<"EOS"
195
EOS

def solve(input_str)
  # 入力
  input_lines = input_str.split("\n")
  _, k = input_lines[0].split.map(&:to_i)
  a = input_lines[1].split.map(&:to_i)

  # 累積和
  s = [0]
  a.each { |num| s << s[-1] + num }

  # 連続するk個の最大和を調べる
  max_sum = 0
  k.upto(a.length) do |i|
    # 今までの最大和より大きければ更新
    section_sum = s[i] - s[i - k]
    max_sum = [max_sum, section_sum].max
  end

  # 連続するk個の最大和を返す
  max_sum
end

# 確認用コード
p solve(INPUT1)
p solve(INPUT2)
