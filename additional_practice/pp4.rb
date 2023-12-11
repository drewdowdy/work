=begin

Problem: Pick out the minimum age from our current Munster family hash

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.min # WRONG
           # returns the KEY with the lowest alphabetical order (a=lowest, z=highest)
           # "E" is the 'lowest' number in the alphabet
# => ["Eddie",10]

# ====================
# Only the age
# ====================

p ages.values.min

# ages.values => [32, 30, 5843, 10, 22, 237]
# (ages.values).min => 10
