=begin

Problem: 

  Add up all of the ages from the Munster family hash

Examples:

  => 6174

Data Structures:

  input: hash
  output: integer (representing sum of all values)
  method: Hash#each

Algorithm:

  - initialize a variable `total` to hold the value of the sum of all ages
  - use the Hash#each method
  - return the sum of all ages
    - add current age to total

Code:

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0

ages.each do |_, age| # we can use underscore `_` to show a parameter we won't use
  total += age
end

puts total
