=begin

Problem: How does take work? Is it destructive? How can we find out?

Answer: The best way to check if a method is destructive, we can check the Ruby docs or test the code in irb. In this case, the `#take` method returns the first `n` elements in a new array.

=end

arr = [1, 2, 3, 4, 5]
p arr.take(2)
p arr
# => [1, 2]
