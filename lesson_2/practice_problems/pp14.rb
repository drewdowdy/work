=begin

Problem:

  Given this data structure write some code to return an array containing the colors of the fruits, and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

  explicit
    - return an array
    - array should contain the colors of fruits and sizes of vegetables
    - sizes should be Uppercase
    - colors should be CAPITALIZED
  implicit
    - if entry is a fruit, get the color
      - then make it uppercase
    - if entry is a vegetable, get the size
      - then make it CAPITALIZED

Example:
  [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

Data:

  input: hash
  output: array

Algorithm:

  - initialize an empty array to contain colors and sizes
  - for each element in the hash
    - if it's a fruit
      - get the color
      - capitalize each color in array
      - add array to initialized array
    - if it's a vegetable
      - get the size
      - upcase the string
      - add to the initialized array

Code:

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},  # ['red','green']
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},  # ['medium']
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'}, # ['red', 'green']
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},     # ['orange']
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},    # ['large']
}


color_and_size = []

hsh.each do |food, info|
  if info[:type] == 'fruit'
    color_and_size << info[:colors].map do |color|
      color.capitalize
    end
  elsif info[:type] == 'vegetable'
    color_and_size << info[:size].upcase
  end
end

p color_and_size
