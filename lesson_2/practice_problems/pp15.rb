=begin

Problem:

  Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

  explicit
    - return an array containing only hashes with even numbers
  implicit
    - elements of array are hashes

Example:

  => [{e: [8], f: [6, 10]}]

Data:

  input: array of hashes
  output: array of hashes

  `#select`: returns an array of those elements for which the block returns a truthy value

Algorithm:

  - use `#select` to choose which hash to keep
    - use `#each` on the hashes to access `letter` and `num_array`
    - if all numbers in array are even, add to initialized array

Code:

=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |num|
      num.even?
    end
  end
end

p even_arr

