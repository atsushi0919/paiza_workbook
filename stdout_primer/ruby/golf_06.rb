#　【n * n の 2 次元配列の表示】N * N の九九表の出力 (paizaランク C 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_boss

n = $<.read.to_i; $> << ((1..n).map { |i| (1..n).map { |j| i * j }.join " " }.join "\n")

# n=$<.read.to_i;$><<((1..n).map{|i|(1..n).map{|j|i*j}.join" "}.join"\n")
