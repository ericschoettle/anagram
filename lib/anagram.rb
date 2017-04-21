require "pry"

class String
  define_method(:anagram_handler) do |word2|
    word1 = self
    word1_lower = word1.downcase
    word2_lower = word2.downcase
    result = "'" + word1.capitalize() + "' and '" + word2 + "' are"
    if word1_lower.anagram?(word2_lower)
      result = result + " anagrams and "
      result = self.palindrome_handler(word2, result)
    elsif word1_lower.antigram?(word2_lower)
      result = result + " antigrams and "
      result = self.palindrome_handler(word2, result)
    end
    result
  end
end

class String
  define_method(:palindrome_handler) do |word2, result|
    word1 = self
    word1_lower = word1.downcase
    word2_lower = word2.downcase
    if word1_lower.palindrome? && word2_lower.palindrome?
      result.concat("both are palindromes")
    elsif (word1_lower + word2_lower).palindrome?
      result.concat("are palindromes of each other")
    elsif word1_lower.palindrome?
      result.concat("'" + word1 + "' is a palindrome")
    elsif word2_lower.palindrome?
      result.concat("'" + word2 + "' is a palindrome")
    else
      result = result [0...-5]
    end
    result
  end
end

class String
  define_method(:antigram?) do |word2|
    word1 = self
    /[word1]/.match(word2)
  end
end

class String
  define_method(:anagram?) do |word2|
    word1 = self
    word1.chars.sort == word2.chars.sort
  end
end

class String
  define_method(:palindrome?) do
    self == self.reverse
  end
end
