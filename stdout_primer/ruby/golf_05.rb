# 【特定の文字で区切り 1 行で出力】大きな数値を 3 けたごとにカンマ区切りで出力 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_boss

$> << $<.read.gsub(/(\d)(?=(\d{3})+(?!(\d)))/, '\1,')

# $><<$<.read.gsub(/(\d)(?=(\d{3})+(?!(\d)))/,'\1,')
