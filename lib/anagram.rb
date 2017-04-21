require "pry"

class String
  define_method(:anagram) do |word2|
    word1 = self
    word1.chars.sort == word2.chars.sort
  end
end
