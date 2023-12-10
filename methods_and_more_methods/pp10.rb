=begin

Problem: What is the return value of the following code? Why?

Answer: The `#map` method returns a new array whose elements are the return value of the block. In this case, when 1 is passed to the block, it is not greater than 1 so its value is returned and put into the new array. When 2 is passed to the block, it is greater than 1 so `#puts` is invoked on it and 2 is output to the console. The return value of `#puts` is always `nil` so `nil` is the 2nd element of the new array. This same thing happens when 3 is passed to the block. As a result, 2 and 3 output to the console and the new array [1, `nil`, `nil`] is returned.

=end

map = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p map

# 2
# 3
# => [1, nil, nil]