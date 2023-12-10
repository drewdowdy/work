=begin

Problem: What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

Answer: The `#any` method returns the boolean `true` if any elements in the collection make the block evaluate as `true` and `false` if none of the elements make the block evaluate as `true`. In this case, the `#puts` method is invoked and the first element 1, is output to the console. and since 1 is odd, it makes the last line true. Since the first element makes the block evaluate as `true`, the `any?` method stops and returns the boolean `true`.

=end

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 1
# => true
