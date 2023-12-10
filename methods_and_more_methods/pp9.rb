=begin

Problem: What is the return value of `map` in the following code? Why?

Answer: The `#map` method returns a new array with elements whose values are the return values of the block. In this case, we call `#map` on a hash but an array is returned. The value of the first element of the new array is `nil` since the size of "ant" is not more than 3. And the second element of the new array is "bear" since its length is more than 3.

=end

hash = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

p hash
# => [nil, "bear"]
