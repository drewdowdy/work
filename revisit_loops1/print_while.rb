=begin

Problem: Using a `while` loop, print 5 randome numbers between 0 and 99 (inclusive)

Example:

62
96
31
16
36

=end

numbers = []
condition = true                  # set `condition` as a condition for `while`
count = 0                         # set `count` to be incremented per iteration

while condition
  num = rand(99)                  # `Kernel#rand` returns a number between 0 and set max
  numbers << num                  # add random number to `numbers` array
  count += 1                      # increment `count` by 1
  condition = false if count == 5 # `condition` changes when condition is met
end

puts numbers                      # outputs all numbers on new lines
