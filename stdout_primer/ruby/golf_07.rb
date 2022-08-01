# 【行によって長さが違う二次元配列の表示】すべての行の長さと値が不定な 2 次元配列の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_boss

m, *a = INPUT1.split[1..].map(&:to_i); b = a.pop m; $> << (b.map { |b| a.shift(b).join(" ") }.join("\n"))

# m,*a=$<.read.split[1..].map &:to_i;b=a.pop m;$><<(b.map{|b|a.shift(b).join" "}.join"\n")
