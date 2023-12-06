=begin

Problem: Write a loop that prints numbers 1-5 and whether the number is even or odd.

Examples:

1 is odd!
2 is even!
3 is odd!
4 is even!
5 is odd!

=end

count = 1

loop do
  puts "#{count} is odd!" if count.odd?
  puts "#{count} is even!" if count.even?
  count += 1
  break if count > 5
end
