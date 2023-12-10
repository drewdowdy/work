=begin

Problem: 

  Turn this array into a hash where the names are the keys and the values are the positions in the array.

  Questions:
    - When we say 'positions', is that the index of the array or its sequential position?
      - ex) {"Fred"=>0} OR {"Fred"=>1}?

Examples:

  {"Fred"=>1, "Barney"=>2, "Wilma"=>3, "Betty"=>4, "Pebbles"=>5, "BamBam"=>6} (?)
  OR
  {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5} (?)

Data Structures:

  input: array
  output: hash

  method: #each_with_object

Algorithm: 

  - use #each_with_object to pass each element into a new hash
  - assign each name as the key
  - assign the index + 1 (since 0 indexed) as the value

=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name) + 1
end

p hash

# ====================
# Alternative
# ====================

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
