=begin

How would you order this array of number strings by descending numeric value?

=end

arr = ['10', '11', '9', '7', '8']

arr1 = arr.sort_by do |num|
  - num.to_i
end

arr2 = arr.sort do |a,b|
  b.to_i <=> a.to_i
end

p arr1
p arr2
