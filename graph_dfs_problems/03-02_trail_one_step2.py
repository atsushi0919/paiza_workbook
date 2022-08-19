# グラフの s,t トレイル (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step2

INPUT1 = """\
5 1 4
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4
"""
OUTPUT1 = """\
1 5 3 2 5 4
"""

INPUT2 = """\
5 5 3
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4
"""
OUTPUT2 = """\
5 1 2 3
"""

INPUT3 = """\
7 6 4
6
2 3 4 5 6 7
6
1 3 4 5 6 7
6
1 2 4 5 6 7
6
1 2 3 5 6 7
6
1 2 3 4 6 7
6
1 2 3 4 5 7
6
1 2 3 4 5 6
"""
OUTPUT3 = """\
6 3 2 5 1 7 2 1 3 5 7 3 4
"""

import copy


class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, t: 終点
    n, s, t = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        if i % 2 != 0:
            continue
        ad_list[i // 2] = list(map(int, line.split()))

    # s から t への経路
    results = []
    trails = [Trail([s], [])]
    while len(trails) > 0:
        trail = trails.pop()
        # t に着いたら経路を記録
        if trail.nodes[-1] == t:
            results.append(trail.nodes)
            continue

        # 隣接頂点に移動する
        cv = trail.nodes[-1]
        for nv in ad_list[cv]:
            e = sorted([cv, nv])
            # 使ったことのある経路、または nv が s ならスキップ
            if e in trail.edges or nv == s:
                continue
            # trail を複製して情報更新
            new_trail = copy.deepcopy(trail)
            new_trail.nodes.append(nv)
            new_trail.edges.append(e)
            trails.append(new_trail)

    # s から t に行ける経路を頂点数で昇順ソート
    results.sort(key=lambda x: len(x))
    # 頂点数が最も多い経路から 1 つ出力
    return " ".join(map(str, results[-1]))


# print(main(open(0).read()))
print(main(INPUT3))

'''
Trail = Struct.new(:nodes, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # s から t への経路を調べる
  results = []
  trails = [Trail.new([s], [])]
  while trails.length > 0
    trail = trails.pop
    if trail.nodes.last == t
      results << trail.nodes
      next
    end
    # 隣接頂点を調べる
    cv = trail.nodes.last
    ad_list[cv].each do |nv|
      e = [cv, nv].sort
      # 使ったことのある経路ならスキップ
      next if trail.edges.include?(e)
      # s は再訪問しない
      next if nv == s

      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.nodes << nv
      new_trail.edges << e
      trails << new_trail
    end
  end
  # 頂点数が最も多い経路から 1 つ出力
  results.sort { |a, b| a.length <=> b.length }.last.join(" ")
end

puts main(STDIN.read)
'''
