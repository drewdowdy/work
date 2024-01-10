=begin

Problem:

  Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

  explicit
    - don't use `Array#to_h`
    - write some code that changes the array to a hash
    - each key is the first item in each sub-array
    - each value is the second item in each sub-array
  implicit
    - maintain the structure of the array as it is changed to a hash  

Example:
 
  {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

Data:

  input: array
  output: hash

  initialize an empty hash

  how to access the sub-arrays w/out returning an array object

Algorithm:

  - initialize an empty hash
  - use `#each` to access the sub-arrays
  - use [] to access each element of sub-arrays, i.e. `sub_array[0]` and `sub_array[1]`
  - for each element, assign hash[sub_array[0]] = sub_array[1]

Code:

=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}

arr.each do |sub_array|
  hsh[sub_array[0]] = sub_array[1]
end

p hsh
