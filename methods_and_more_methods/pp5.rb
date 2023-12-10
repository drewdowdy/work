=begin

Problem: What does shift do in the following code? How can we find out?

Answer: We can find the answer by checking the Ruby docs. According to the Ruby docs, `Hash#shift` will remove the first entry and return a 2 element array containing the removed key-value pair. Based on this information, the following code will return the array [:a, `ant`].

=end

hash = { a: 'ant', b: 'bear' }
p hash.shift
