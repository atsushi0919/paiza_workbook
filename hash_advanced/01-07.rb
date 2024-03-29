# 最小完全ハッシュ関数を作ろう (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__minimum_complete

# 定数
CORRECTION_VALUE = 97   # a ~ f を 0 ~ 5 に対応させる補正値
RADIX = 6               # 6 進数で計算する

# ハッシュ値を返す
def hash(s)
  s.chars.reverse_each.with_index.map { |ci, i|
    (ci.ord - CORRECTION_VALUE) * RADIX ** i
  }.sum
end

# 入力
s = gets.chomp

# ハッシュ値を出力
puts hash(s)

=begin
ハッシュ関数の中には特殊なものが存在します。
まず完全ハッシュ関数とは、全ての正しい入力に対して重複なくハッシュ値が対応するハッシュ関数です。
そして、最小完全ハッシュ関数とは、全ての正しい入力 n 個に対して重複なくハッシュ値が対応し、
さらにその値域が n 個の連続な整数（通常は 0 から n-1 ）となっているハッシュ関数です。
本問では、この最小完全ハッシュ関数を実装してみましょう。

a, b, c, d, e, f の 6 つの文字からなる長さが 6 の文字列 S が与えられます。
以下の条件をみたすハッシュ関数をつくり、そのハッシュ値を計算してください。

最小完全ハッシュ関数である。

aaaaaa のハッシュ値は 0 で aaaaabは 1 というように、辞書順に 1 ずつ増えていき、最後の ffffff のハッシュ値は 46655 となる。
▼　下記解答欄にコードを記入してみよう

入力される値
S

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
上記の条件をみたすハッシュ関数を用いてハッシュ値を計算し、1 行で出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


S は半角小文字英字 a, b, c, d, e, f のいずれかで構成される長さ 6 の文字列
入力例1
aaaaaa

出力例1
0

入力例2
ffffff

出力例2
46655

入力例3
abcdef

出力例3
1865
=end
