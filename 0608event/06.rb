a_list, b_list = $stdin.readlines.map(&:split)
puts (b_list - a_list).empty? ? "Yes" : "No"

# a_list = gets.strip.split
# b_list = gets.strip.split

# found = true
# b_list.each do |num|
#   unless a_list.include?(num)
#     found = false
#     break
#   end
# end

# if found
#   puts "Yes"
# else
#   puts "No"
# end
