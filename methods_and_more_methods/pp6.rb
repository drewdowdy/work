=begin

Problem: What is the return value of the following statement? Why?

Answer: The `#pop` method removes and returns the final element of a collection. And the `#size` method returns a number that represents the length of a given collection. In this case `caterpillar` is removed from the collection with `#pop` and then `size` returns the number of characters in `caterpillar`, which is 11.

=end

p ['ant', 'bear', 'caterpillar'].pop.size
# => 11
