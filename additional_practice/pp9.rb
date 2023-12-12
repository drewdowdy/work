=begin

Problem: 

Create a method `titleize` that creates a string that has each word capitalized as it would be in a title. 

rules:
  explicit
    - method name is `titleize`
  implicit
    - mutates the original string

Questions:
  - does this method mutate the argument

Examples:

words = "the flintstones rock"
words = "The Flintstones Rock"

Data Structures:

input: string
output: string (new)

=end



def titleize(string)
  array_of_words = string.split                # makes an array where the elements are words
  array_of_words.map! {|word| word.capitalize} # capitalizes each word in the array
  new_string = array_of_words.join(" ")        # makes the array back into a string
  string.sub!(string, new_string)              # mutates the original string to the new capitalized string
end

words = "the flintstones rock"

titleize(words)

words == "The Flintstones Rock"

# =========================
# Alternative
# =========================

def titleize2(string)
  string.split.map { |word| word.capitalize }.join(' ') # does not mutate the original string
end

words = "the flintstones rock"
titleize2(words)
words
