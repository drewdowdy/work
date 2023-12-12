=begin

Problem: 

  Create a hash that expresses the frequency with which each letter occurs in the string.

  Rules
    explicit
      - input is a string, output is a hash
      - key-value pairs are letters and integers
    implicit
      - capital letters are separate from lower case letters 

Example:

  statement = "The Flintstones Rock"
  { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

Data Structures:

  input: string
  output: hash (keys - letter, values- number)

  methods
    - #each_char  -> executes a block for each letter of a string)
    - Hash#new(0) -> makes an empty hash with all values set to 0

Algorithm:

  - create an empty hash with all values set to 0
   - Hash#new(0)
  - iterate over the sting and incriment the value for every letter


Code:

=end

statement = "The Flintstones Rock"

letter_count_hash = Hash.new(0)   # creates a hash where default values are 0

statement.each_char do |letter|   # `#each_char` executes the block for each iteration over a string
  next if letter == " "           # skips if `letter` is an empty space
  letter_count_hash[letter] += 1  # creates new entry and increments value by 1 per letter
end

p letter_count_hash
# => {"T"=>1, "h"=>1, "e"=>2, "F"=>1, "l"=>1, "i"=>1, "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1, "k"=>1}

# ====================
# Alternative
# ====================

statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter) # `#count` returns an integer representing the number of elements
  result[letter] = letter_frequency if letter_frequency > 0
end
