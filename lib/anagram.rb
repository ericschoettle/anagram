require "pry"
require "rest-client"

class String
  define_method(:anagram_handler) do |word2|
    word1 = self
    word1_prep, word2_prep = word1.prep(word2)
    result = "'" + word1.capitalize() + "' and '" + word2 + "' are"
    if word1 != word2
      if word1.test_word(word2) == true
        if word1_prep.anagram?(word2_prep)
          result = result + " anagrams and "
          result = self.palindrome_handler(word2, result)
        elsif word1_prep.antigram?(word2_prep)
          result = result + " antigrams and "
          result = self.palindrome_handler(word2, result)
        else
          result = result + " neither anagrams nor antigrams but "
          result = self.palindrome_handler(word2, result)
        end
      else
        result = word1.test_word(word2).capitalize + " isn't a word!"
      end
    else
      result = "Trying to be clever, putting in the same word twice..."
    end

    result
  end
end

class String
  define_method(:test_word) do |word2|
    test_result = true
    wordsArray = self.split(" ") + word2.split(" ")
    wordsArray.each() do |word|
      word = word.prep("").join("")
      url = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/" + word + "?key=dc368593-f759-4a0f-b8da-2e87f78e0fed"
      if not RestClient.get(url).include?("entry id")
        test_result = word
      end
    end
    test_result
  end
end

class String
  define_method(:palindrome_handler) do |word2, result|
    word1 = self
    word1_prep, word2_prep = word1.prep(word2)
    if word1_prep.palindrome? && word2_prep.palindrome?
      result.concat("both are palindromes")
    elsif (word1_prep + word2_prep).palindrome?
      result.concat("are palindromes of each other")
    elsif word1_prep.palindrome?
      result.concat("'" + word1 + "' is a palindrome")
    elsif word2_prep.palindrome?
      result.concat("'" + word2 + "' is a palindrome")
    else
      result = result [0...-5]
    end
    result
  end
end

class String
  define_method(:antigram?) do |word2|
    /[#{Regexp.quote(self)}]/ !~ word2
  end
end

class String
  define_method(:anagram?) do |word2|
    self.chars.sort == word2.chars.sort
  end
end

class String
  define_method(:palindrome?) do
    self == self.reverse
  end
end

class String
  define_method(:prep) do |word2|
    word1_prep = self.downcase.tr('^a-z', '')
    word2_prep = word2.downcase.tr('^a-z', '')
    return word1_prep, word2_prep
  end
end
