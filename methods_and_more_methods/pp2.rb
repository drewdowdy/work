=begin

Problem: How does count treat the block's return value? How can we find out?

Answer: We can check the Ruby docs and see that `#count` returns the number of elements that make the block evaluate as `true`. This means that `#count` considers the truthiness of the block.

=end

count = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p count
# => 2
