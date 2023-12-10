=begin

Problem: What is the return value of each_with_object in the following code? Why?

Answer: The `#each_with_object` method iterates over the original collection and puts the results of the block into the objet that was passed to it. In this case, a hash object `{}` was passed and the evaluations of the block became the key,value pairs in the hash object `{}`.

=end

each_with_object = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p each_with_object

# => {"a"=>"ant", "b"=>"bear", "c"=>"cat"}
