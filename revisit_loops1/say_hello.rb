=begin

Problem: Modify the code so `"Hello!"` prints 5 times

=end

say_hello = true
count = 0                         # add variable `count` set to 0

while say_hello
  puts 'Hello!'
  count += 1                      # increment `count` by 1 per iteration
  say_hello = false if count == 5 # add a condition to change how `say_hello` evaluates
end
