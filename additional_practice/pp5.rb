=begin

Problem: Find the index of the first name that starts with "Be"

=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

name = flintstones.select do |name|
  name.start_with?("Be")
end

p flintstones.index(name[0])

# ====================
# Alternatives
# ====================

flintstones.index { |name| name[0, 2] == "Be" }
# When given a block, `#index` will return the index for the first element that makes the block truthy
