[1, 2, 3].each do |num| # arrays only need one parameter
  puts num
end
# 1
# 2
# 3

hash = {a: 1, b: 2, c: 3}

hash.each do |key, value| # hashes need 2 parameters
  puts "The key is #{key} and the value is #{value}."
end
# The key is :a and the value is 1.
# The key is :b and the value is 2.
# The key is :c and the value is 3.


[1, 2, 3, 4, 5].select do |num| # `select` only cares about truthiness
  num.odd?
end
# => [1, 3, 5]

[1, 2, 3 ,4, 5].map do |num| #`map` uses the return value to transform the array
  num * 2
end
# => [2, 4, 6, 8, 10]


