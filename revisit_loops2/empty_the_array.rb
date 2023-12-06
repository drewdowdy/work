=begin

Problem: Use loop to remove and print each name from first to last. Stop the loop once names doesn't contain any more elements.

=end

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# #shift - remove and return the LEADING element of a collection
# #pop   - remove and return the LAST element of a collection
