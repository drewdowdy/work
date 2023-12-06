=begin

Problem: Given the array of several numbers below, use an until loop to print each number.

Examples:

7
9
13
25
18

=end

numbers = [7, 9, 13, 25, 18]
index = 0

until index == numbers.size
  puts numbers[index]
  index += 1 
end
