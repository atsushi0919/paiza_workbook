# ファイル検索 (paizaランク A 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step4

INPUT1 = <<"EOS"
3 4 3
file1 dirb
file2 dird
file3 dira
root dira
dira dirb
dira dirc
dirc dird
file1
file2
file3
EOS
OUT1 = <<"EOS"
root/dira/dirb/file1
root/dira/dirc/dird/file2
root/dira/file3
EOS

INPUT2 = <<"EOS"
1 0 1
file1 root
file1
EOS
OUTPUT2 = <<"EOS"
root/file1
EOS

# 入力
# input_lines = $stdin.read.split("\n")
input_lines = INPUT1.split("\n")
n, m, q = input_lines.shift.split.map(&:to_i)
fd = input_lines.shift(n).map(&:split)
xy = input_lines.shift(m).map(&:split)
rq = input_lines.shift(q)

# ファイルの場所
files = fd.map { |f, d| [f, [d]] }.to_h
# ディレクトリの親子関係 (y の 親が x)
directories = xy.map { |x, y| [y, x] }.to_h

# ファイルのフルパスを調べる
res = []
rq.each do |file_name|
  d_path = files[file_name]
  loop do
    if d_path[0] == "root"
      res << (d_path + [file_name]).join("/")
      break
    end
    d_path.unshift(directories[d_path[0]])
  end
end

# フルパスを調べた結果を出力
puts res.join("\n")

=begin
京子ちゃんはファイル検索サービスを作成しようとしています。現在コンピュータ内にファイルは全部で N 個あります。
ファイル i の名前は F_i で、ディレクトリ D_i に含まれています。また、ディレクトリは別のディレクトリを含むことができます。
ディレクトリの親子関係は M 個あり、ディレクトリ X_i の中にディレクトリ Y_i が存在しています。

クエリが Q 回与えられます。 i 回目のクエリではファイル S_i のディレクトリパスを以下に示す、 root/foo/bar/file のような形式で答えてください。

ディレクトリパスの先頭は必ず root から始まり、末尾は検索対象ファイル名です。
root ディレクトリと検索対象ファイルの間には、 root ディレクトリから子ディレクトリを辿って検索対象へ移動するときの、
経由したディレクトリ名を / 区切りで挿入します。

サンプル 1 の場合、以下のようなディレクトリ構造になっています。

▼　下記解答欄にコードを記入してみよう

入力される値
N M Q
F_1 D_1
F_2 D_2
..
F_N D_N
X_1 Y_1
X_2 Y_2
...
X_M Y_M
S_1
S_2
...
S_Q


・ 1 行目に、ファイルの数 N 、ディレクトリの親子関係の数 M 、クエリの数 Q が与えられます。
・ 2 行目から N 行にかけて、ディレクトリとファイルの親子関係が与えられます。ディレクトリ D_i の中にファイル F_i が存在しています。
・ N + 1 行目から M 行にかけて、ディレクトリの親子関係が与えられます。ディレクトリ X_i の中にディレクトリ Y_i が存在しています。
・ N + M + 1 行目から Q 行にかけて、検索対象のファイル S_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
クエリが Q 回与えられます。 i 回目のクエリではファイル S_i のディレクトリパスを答えてください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N ≦ 999
・ 2 ≦ ファイルの個数 + ディレクトリの個数 ≦ 1,000
・ 1 ≦ Q ≦ 1,000
・ F_i, D_i, X_i, Y_i, S_i は英小文字 + 数字からなる 10 文字以下の文字列
・ F_i ≠ D_j, F_i ≠ X_j, F_i ≠ Y_j
・ X_i ≠ Y_i
・ 同名の 2 つのファイルやディレクトリは存在しない
・ X_i = D_i や Y_i = D_i となる可能性は存在する
・ ディレクトリの親子関係に矛盾は存在しない
・ S_i はかならず F の中に含まれている
・ root ディレクトリ以外のすべてのファイル、ディレクトリは root ディレクトリまたは他のディレクトリに含まれている

入力例1
3 4 3
file1 dirb
file2 dird
file3 dira
root dira
dira dirb
dira dirc
dirc dird
file1
file2
file3

出力例1
root/dira/dirb/file1
root/dira/dirc/dird/file2
root/dira/file3

入力例2
1 0 1
file1 root
file1

出力例2
root/file1
=end
