=begin

Problem: Modify the code so the loop stops iterating when the user inputs `yes`

  Question: Does case matter? Can the user input `Yes` or `y` or `Y`?
  
=end

loop do
  puts 'Should I stop looping now? (yes/no)'
  answer = gets.chomp
  break if answer == 'yes'
end
