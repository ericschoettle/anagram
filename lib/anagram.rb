require "pry"

class String
  define_method(:anagram_handler) do |word2|
    word1 = self
    word1_lower = word1.downcase
    word2_lower = word2.downcase
    result = "'" + word1.capitalize() + "' and '" + word2 + "' are"
    if word1_lower.anagram?(word2_lower)
      result = result + " anagrams and "
      if word1_lower.palindrome?
        result.concat("'" + word1 + "' is a palindrome")
      elsif word2_lower.palindrome?
        result.concat("'" + word2 + "' is a palindrome")
      else
        result = result.chomp(" and ")
      end
    end
    result
  end
end

class String
  define_method(:anagram?) do |word2|
    word1 = self
    word1.chars.sort == word2.chars.sort
  end
end

# class String
#   define_method(:palindrome_handler) do |word2|
#     word1_lower = self.downcase
#     word2_lower = word2.downcase
#     result = ""
#     if word1_lower.anagram(word2_lower)
#       result = word1 + " and " + word2 "are anagrams"
#       if word1_lower.palindrome
#         result.concat("and" + word1 + "is a palindrome")
#       elsif word2_lower.palindrome
#         result.concat("and" + word2 + "is a palindrome")
#       end
#     end
#   end
# end

class String
  define_method(:palindrome?) do
    self == self.reverse
  end
end
