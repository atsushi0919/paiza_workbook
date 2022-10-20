# 島探し (paizaランク S 相当)
# https://paiza.jp/works/mondai/skillcheck_sample/search-island

INPUT1 = <<~"EOS"
  4 5
  0 1 1 0
  1 0 1 0
  1 0 0 0
  0 0 1 1
  0 1 1 1
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  6 6
  1 1 1 1 1 1
  1 0 1 0 0 0
  1 0 1 0 1 1
  0 1 0 0 0 1
  1 0 1 1 1 1
  0 1 0 0 0 0
EOS
OUTPUT2 = <<~"EOS"
  5
EOS

class Field
  VY = [1, 0, -1, 0]
  VX = [0, 1, 0, -1]

  def initialize(h, w, field_data)
    @h = h
    @w = w
    @field_data = field_data
  end

  def count_island
    @memo = @field_data.map(&:dup)
    count = 0
    (0...@h).each do |y|
      (0...@w).each do |x|
        if @memo[y][x] == "1"
          dfs(y, x)
          count += 1
        end
      end
    end
    count
  end

  private def dfs(y, x)
    stack = [[y, x]]
    while stack.size > 0
      y, x = stack.pop
      @memo[y][x] = "0"
      VY.zip(VX).each do |dy, dx|
        ny = y + dy
        nx = x + dx
        if 0 <= ny && ny < @h && 0 <= nx && nx < @w && @memo[ny][nx] == "1"
          stack << [ny, nx]
        end
      end
    end
  end
end

def solve(input_str)
  input_lines = input_str.split("\n")
  w, h = input_lines.shift.split.map(&:to_i)
  field = Field.new(h, w, input_lines.map(&:split))
  field.count_island
end

puts solve(STDIN.read)
