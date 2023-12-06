=begin

Problem: Modify the following code so that the loop stops if number is equal to or between 0 and 10.

=end

puts "This uses `#include?` in the loop:"

loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end

puts "This uses `#between?` in the loop:"

loop do
  number = rand(100)
  puts number
  break if number.between?(0,10)
end
