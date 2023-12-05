# ====================
# `Enumerable#any?`
#   - returns a boolean
#   - `true` if any iteration makes the block truthy
# ====================

[1, 2, 3].any? do |num|
  num > 2
end
# => true

{a: 'ant', b: 'bear', c: 'cat'}.any? do |key, value|
  value.size > 4
end
# => false

# ====================
# `Enumerable#all?`
#   - returns a boolean
#   - `true` if EVERY iteration makes the block truthy
# ====================

[1, 2, 3].all? do |num|
  num > 2
end
# => false

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true

# ====================
# `Enumerable#each_with_index`
#   - executes the block for each iteration
#   - takes two parameters  (one for the element / key-value pair array and one for the index)
# ====================

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }

# ====================
# `Enumerable#each_with_object`
#   - first parameter is the collection object; second parameter is the collection object
#   - method argument (between parentheses `()`) is able to be 
# ====================

[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }


