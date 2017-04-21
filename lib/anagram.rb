require "pry"

class String
  define_method(:anagram_handler) do |word2|
    word1 = self.downcase
    word2 = word2.downcase
    word1.anagram(word2)
  end
end

class String
  define_method(:anagram) do |word2|
    word1 = self
    word1.chars.sort == word2.chars.sort
  end
end
