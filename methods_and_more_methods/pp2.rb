=begin

Problem: How does count treat the block's return value? How can we find out?

=end

count = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p count
# => 2


