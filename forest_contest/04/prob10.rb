def solve(input_str)
  a = input_str.split.map(&:to_i)

  0.upto(8) do |i|
    min_t, max_t = a[i..i + 1].minmax
    return "Yes" if max_t - min_t >= 3
  end
  "No"
end

puts solve(STDIN.read)
