=begin

Problem: Modify the code so that each loop stops afte the first iteration

=end

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break # use `break` here to exit inner loop
   end

  break   # and here to exit the outer loop
end

puts 'This is outside all loops.'
