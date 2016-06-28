sum = 0
1000.times do |i|
  sum = sum + i if i % 3 < 1 || i % 5 < 1
end
puts sum
