n = gets.to_i

9.downto(1) do |i|
  if n >= i * 11
    puts i * 11
    break
  end
end
