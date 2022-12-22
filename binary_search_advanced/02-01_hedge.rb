# 垣根 (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search_advanced/binary_search_advanced__hedge

INPUT1 = <<~"EOS"
  2 1000
  1 1 500
  2 1 100
EOS
OUTPUT1 = <<~"EOS"
  22
EOS

input_lines = $stdin.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
trees = input_lines.shift(n).map { |e| e.split.map(&:to_i) }

left = 1
right = 10 ** 6
while left < right - 1
  t = (left + right) / 2
  height = trees.map { |a, b, c| a * t ** 2 + b * t + c }.min
  if height < k
    left = t
  else
    right = t
  end
end

puts right

=begin

n, k = map(int, input().split())
abc = [list(map(int, input().split())) for _ in range(n)]

def check(t):
    for a,b,c in abc:
        if(a*t*t + b*t + c < k) :
            return 0
    return 1

# leftは常に条件を満たさない，rightは常に条件を満たす
left, right = 1, 1<<24
while right-left > 1:
    mid = (left+right) // 2
    if(check(mid)): right = mid
    else : left = mid
print(right)

paiza 君は、N 本の木を一直線上に植えました。
そのうち左から i 番目の木は、t 秒後には高さ A_i t^2 + B_i t + C_i まで成長します。

paiza 君はこれらの木で高さ K の垣根をつくりたいと考えています。すべての木の高さが K 以上になるのは何秒後でしょうか。

▼　下記解答欄にコードを記入してみよう

入力される値
N K
A_1 B_1 C_1
A_2 B_2 C_2
...
A_N B_N C_N


・ 1 行目に、木の本数を表す整数 N と、垣根の高さを表す整数 K が半角スペース区切りで与えられます。
・ 続く N 行に、整数の組 A_i, B_i, C_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
問題の答えを、1 行に整数で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ N ≦ 200,000 = 2 × 10^5
・ 2 ≦ K ≦ 1,000,000,000,000 = 10^12
・ 1 ≦ A_i, B_i, C_i ≦ 1,000,000 = 10^6
・ C_i < K を満たす i が存在する (すべての木の高さが最初から K 以上になっていることはない)

入力例1
2 1000
1 1 500
2 1 100

出力例1
22
=end
