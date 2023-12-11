=begin

Problem: 

  Remove people with ages 100 and over

  Questions:
    - Should the original hash be mutated? preserved?

Examples:

  ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

Data Structures:

  input: hash
  output: hash (mutated)
  method: #reject!

Algorithm:

  - Use the #reject! method
  - reject all values that are more than 100

Code:

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject!do |_,age|
  age > 100
end

p ages

# =========================
# Alternatives
# =========================

p ages.keep_if do |_,age| # mutates the caller
  age < 100 
end

p ages.select do |name,age| # does NOT mutate the caller
  age < 100 
end

