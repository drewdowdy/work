=begin

Problem: Modify the loop so it iterates 5 times.

=end

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1         # increment `iterations` by 1 per loop
  break if iterations > 5 # add `if` statement to break under a condition
end
