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

# ====================
# `Enumerable#first`
#   - returns the first element of a collection
#   - if given an integer, returns the specified number of elements
# ====================

[1, 2, 3].first
# => 1

{ a: "ant", b: "bear", c: "cat" }.first(2) # rare with hashes
# => [[:a, "ant"], [:b, "bear"]]

# ====================
# `Enumerable#include?`
#   - returns boolean `true` if argument exists in the collection
#   - for hashes, intention is not explicit
#     - preferences: `Hash#key?` > `Hash#has_key?` > `Enumerable#include?`
#                    `Hash#value?` > `Hash#has_value?` > hash.value.include?
# ====================

[1, 2, 3].include?(1)
# => true

{ a: "ant", b: "bear", c: "cat" }.include?("ant") # for hashes, `include?` only checks keys
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)    # for hashes, `include?` only checks keys
# => true

# ====================
# `Enumerable#partition`
#   - divides elements into two collections depending on the return value of the block
#   - for hashes, returns a nested array
#     - can convert back to hash with `Array#to_h`
# ====================

[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]
even # => [2]

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]

long.to_h # => { :b => "bear" }
short.to_h  # => { :a => "ant", :c => "cat" }
