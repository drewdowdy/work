=begin

Problem:

  Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

  explicit
    - return a new array object
    - don't alter the sub-arrays
    - order the sub-arrays according to the odd numbers they contain
  implicit
    - ignore the even numbers, but don't delete them

Example:

  [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

Data:

  input: array
  output: new array

  `#sort_by`: returns an array of elements of self, sorted according to the value returned by the block for each element.

Algorithm:

  -

Code:

=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

odd_sorted_arr = arr.sort_by do |sub_array|
  sub_array.select do |element|
    element.odd?
  end
end

p odd_sorted_arr
