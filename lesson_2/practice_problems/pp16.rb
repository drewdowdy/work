=begin

Problem:

  Write a method that returns one UUID when called with no parameters.

  Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

  explicit
    - make a method that returns one UUID
  implicit
    - a UUID has 32 hexadecimal characters
    - a UUID is broken into 5 sections
    - should be represented as a string
    - 8 characters, 4 characters, 4 characters, 4 characters, 12 characters

Example:

  "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Data:

  input: none
  output: string

  hexidecimal numbers use: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f

Algorithm:

  - define a method `make_uuid`
  - initialize an empty string called "uuid"
  - initialize an array of all hexidecimal characters
  - initialize an array of the number of characters in each section
  - for each numer in the array of sections
    - append a random character from the array of hexidecial characters array to "uuid"
    - add a hyphen `-`
  - 
  - return original string now containing UUID

Code:

=end

def make_uuid
  uuid = ""
  
  hexadecimal_nums = []
  (0..9).each {|num| hexadecimal_nums << num.to_s}
  ('a'..'f').each {|letter| hexadecimal_nums << letter}

  sections = [8, 4, 4, 4, 12]

  sections.each do |num|
    num.times do
      uuid << hexadecimal_nums.sample.to_s
    end
    uuid << "-" unless num == 12
  end

  uuid
end

p make_uuid
