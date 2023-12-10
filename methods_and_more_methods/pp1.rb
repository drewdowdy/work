=begin

Problem: What is the return value of the `select` method below? Why?

=end

select = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p select

# `#select` returns the numbers for which the block is truthy. And since the last line of the block is the string `hi`, it evaluates as true. In Ruby, all objects except for the boolean `false` and `nil` are truthy.
