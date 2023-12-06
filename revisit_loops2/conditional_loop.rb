=begin

Problem: Write an if/else statement that executes some code if `process_the_loop` is `true` and some other code if `process_the_loop` is `false`. If `true`, execute a loop that iterates exactly once and prints The loop was processed during that iteration. If `false`, print The loop wasn't processed!

Examples:

The loop was processed
The loop wasn't processed!

=end

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts 'The loop was processed'
    break
  end
else
  puts "The loop wasn't processed!"
end
