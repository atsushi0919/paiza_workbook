# Q4: データの分類 (paizaランク A 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q4_knn

INPUT1 = <<~"EOS"
  5
  2 0 5
  1 1 10
  2 -2 100
  -1 0 5
  0 1 10
  0 0
  3
  1
  5
  3
EOS
OUTPUT1 = <<~"EOS"
  5
  5
  10
EOS

INPUT2 = <<~"EOS"
  25
  -9637 5053 610801513
  -333 2294 755868490
  -8701 5119 346687404
  -7904 634 709727392
  2747 1881 559605979
  7390 -650 564842899
  -402 3073 499670008
  583 6717 241975343
  6301 133 567085787
  6823 -6308 842240951
  8611 7554 563233697
  2298 662 674874071
  2826 -5848 248604683
  9886 1008 492242046
  -656 -4542 660672195
  -4878 -1460 995420942
  -912 8199 510475731
  -8774 -9285 169429550
  -8810 -5108 346044447
  4938 9239 672334688
  5343 9669 516968389
  -8543 -5823 525061884
  -7066 157 871509050
  -4886 5073 79563747
  3963 -2074 696149476
  3065 3724
  17
  11
  19
  24
  19
  17
  22
  14
  18
  25
  7
  12
  18
  23
  21
  25
  23
  8
EOS
OUTPUT2 = <<~"EOS"
  241975343
  79563747
  79563747
  79563747
  79563747
  79563747
  79563747
  79563747
  79563747
  241975343
  241975343
  79563747
  79563747
  79563747
  79563747
  79563747
  241975343
EOS

input_lines = STDIN.read.split("\n")
n = input_lines.shift.to_i
a = input_lines.shift(n).map { |line| line.split.map(&:to_i) }
tx, ty = input_lines.shift.split.map(&:to_i)
_, *k = input_lines.map(&:to_i)

uniq_k = k.uniq.sort
labels = a.map { |x, y, c| [((x - tx) ** 2 + (y - ty) ** 2) ** 0.5, c] }.sort.map { |_, l| l }

k_i = uniq_k.shift
lbl_agg = Hash.new(0)
predicted_lbl = {}
major = { lbl: 0, cnt: 0 }
labels.each.with_index(1) do |lbl, i|
  lbl_agg[lbl] += 1
  if lbl_agg[lbl] > major[:cnt] || lbl_agg[lbl] == major[:cnt] && lbl < major[:lbl]
    major[:lbl] = lbl
    major[:cnt] = lbl_agg[lbl]
  end
  if k_i == i
    predicted_lbl[k_i] = major[:lbl]
    break if uniq_k.empty?
    k_i = uniq_k.shift
  end
end

puts k.map { |k_i| predicted_lbl[k_i] }.join("\n")
