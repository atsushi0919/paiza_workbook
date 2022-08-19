# グラフのトレイル (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step1

INPUT1 = """\
3 1 2
"""
OUTPUT1 = """\
1 2 3
"""

INPUT2 = """\
5 1 5
"""
OUTPUT2 = """\
1 5 3 4 5 2
"""

INPUT3 = """\
14 3 9
"""

import copy


class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, k: 回数
    n, s, k = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for i in range(1, n + 1):
        ad_list[i] = [j for j in range(1, n + 1) if j != i]

    # 起点 s から k 回移動する経路
    edges = [[False for w in range(n)] for h in range(n)]
    trails = [Trail([s], edges)]
    while len(trails) > 0:
        trail = trails.pop()
        # k 回移動したら経路を記録
        if len(trail.nodes) == k + 1:
            return " ".join(map(str, trail.nodes))

        # 隣接頂点に移動する
        cv = trail.nodes[-1]
        for nv in ad_list[cv]:
            # 使ったことのある経路ならスキップ
            if trail.edges[cv - 1][nv - 1]:
                continue
            if trail.edges[nv - 1][cv - 1]:
                continue

            # trail を複製して情報更新
            new_trail = copy.deepcopy(trail)
            new_trail.nodes.append(nv)
            new_trail.edges[cv - 1][nv - 1] = True
            new_trail.edges[nv - 1][cv - 1] = True
            trails.append(new_trail)


# print(main(open(0).read()))
print(main(INPUT3))

'''
Trail = Struct.new(:nodes, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = Hash.new { [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      ad_list[i] <<= j if i != j
    end
  end

  # k 回移動
  trails = [Trail.new([s], [])]
  while trails.length > 0
    trail = trails.pop

    # k 回移動した経路を出力
    if trail.nodes.length == k + 1
      return trail.nodes.join(" ")
    end
    # 隣接頂点に移動する
    cv = trail.nodes.last
    ad_list[cv].each do |nv|
      e = [cv, nv].sort
      # 使ったことのある経路ならスキップ
      next if trail.edges.include?(e)

      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.nodes << nv
      new_trail.edges << e
      trails << new_trail
    end
  end
end

puts main(STDIN.read)
'''
