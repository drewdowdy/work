=begin

Problem: What is the return value of `reject` in the following code? Why?

Answer: According to the Ruby docs, `#reject` returns a new array of any elements that make the block return `false` or `nil`. The block has the `#puts` method invoked which always returns `nil`. So each element will output to the console and a new array containing all the elements will be returned.

=end

reject = [1, 2, 3].reject do |num|
  puts num
end

p reject

# 1
# 2
# 3
# => [1, 2, 3]
