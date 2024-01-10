# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

=begin

Problem:

  explicit
    - use `#select` or `#reject` methods (or other combination of methods)
    - return a new array identical in structure to the original
    - the new array contains only the integers are multiples of 3
  implicit
    - do not mutate the original array
    - maintain the original structure of array

Example:

  => [[], [3, 12], [9], [15]]

Data:

  `#select`: returns a new array for all elements that make a given block truthy
  `#reject`: returns a new array for all elements that make a given block falsy or `nil`
  
Algorithm:

  - use `#map` to access the elements of the outermost array
  - use `#select` over each sub-array
    - return all values that are multiples of 3 using `n % 3 == 0`

Code:

=end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

mult_3_arr = arr. map do |sub_array|
  sub_array.select do |num|
    num % 3 == 0
  end
end

p mult_3_arr
