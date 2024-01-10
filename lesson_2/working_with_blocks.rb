[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin

| Line | Action	           | Object	     | Side-Effect | Return Value     | Is Return Value Used? |
|------|-------------------|-------------|-------------|------------------|-----------------------|
| 1    | method call (map) | outer array | none        | new array [1, 3] | no                    |
| 1-4  | block execution   |           |||||

=end

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]


[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

