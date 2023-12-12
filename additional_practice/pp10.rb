=begin

Problem: 

  Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior).  A kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

Example:
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Data Structures:

  input: hash
  output: hash (mutated)

Algorithm:

  - append the new key-value pairs onto each 
    - Hash[key] = value
  - if 'age' < 17
    - kid
  - if 'age' > 17 && < 64
    - adult
  - if 'age' > 64
    - senior
 
Code:

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |name, hash|
  if hash['age'] < 17
    hash['age_group'] = 'kid'
  elsif hash['age'] > 17 && hash['age'] < 64
    hash['age_group'] = 'adult'
  elsif hash['age'] > 64
    hash['age_group'] = 'senior'
  end
end

munsters

# =========================
# Hint:
#   - use a `case` statement
#   - use a `Range` object
# =========================

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name,hash|
  case hash["age"]
  when 0..17
    hash['age_group'] = 'kid'
  when 18..64
    hash['age_group'] = 'adult'
  else
    hash['age_group'] = 'senior'
  end
end

puts munsters
    
