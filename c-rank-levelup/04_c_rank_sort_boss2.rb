def solve1(input_lines)
  sorted_ary = []
  input_lines.each do |t_g, t_s|
    inserted = false
    sorted_ary.each_with_index do |items, idx|
      a_g, a_s = items
      if t_s > a_s || t_s == a_s && t_g > a_g
        sorted_ary.insert(idx, [t_g, t_s])
        inserted = true
        break
      end
    end
    sorted_ary << [t_g, t_s] if not inserted
  end
  sorted_ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

def solve2(input_lines)
  ary = input_lines
  ary.sort_by! { |x| [x[1], x[0]] }.reverse!
  ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

srand(0)
n = 8000
max_num = 1000
ary = Array.new(n) { [rand(max_num), rand(max_num)] }

start_time = Time.now
solve1(ary)
puts Time.now - start_time

# solve1, n=10**2 -> 0.0005054
# solve1, n=10**3 -> 0.0342124
# solve1, n=10**4 -> 2.9948103

# solve2, n=10**2 -> 0.0003123
# solve2, n=10**3 -> 0.0079602
# solve2, n=10**4 -> 0.0565067
# solve2, n=10**5 -> 0.7052143
# solve2, n=10**6 -> 8.8317392
