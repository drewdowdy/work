# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number         # outputs number to console
  numbers.shift(1) # removes leading element
end

=begin

1st iteration
  [1, 2, 3, 4]
  index:  0 += 1
  output: 1

2nd iteration
  [2, 3, 4]
  index:  1 += 1
  output: 3

3rd iteration
  [3, 4]
  index:  2 (does not exist anymore)
  output: nothing (stops)

output:

1
3
=>[3, 4]

=end

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin

1st iteration
[1, 2, 3, 4]
  index:  0
  output: 1

2nd iteration
[1, 2, 3]
  index:  1
  output: 2

3rd iteration
[1, 2]
  index:  2 (does not exist anymore)
  output: nothing (stops)

output:

1
2
=>[1, 2]

=end
