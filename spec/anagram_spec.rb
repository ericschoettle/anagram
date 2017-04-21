require('rspec')
require('./lib/anagram')

describe('String.anagram') do
  it("tests if a word is an anagram") do
    expect("star".anagram_handler("rats")).to(eq("'Star' and 'rats' are anagrams"))
  end
  it("is case insensitive") do
    expect("Aide".anagram_handler("Idea")).to(eq("'Aide' and 'Idea' are anagrams"))
  end
  it("tests if words are both anagrams of each other and if either is a palindrome") do
    expect("dad".anagram_handler("add")).to(eq("'Dad' and 'add' are anagrams and 'dad' is a palindrome"))
  end
  it("tests if words are both anagrams of each other and if both are palindromes") do
    expect("otto".anagram_handler("toot")).to(eq("'Otto' and 'toot' are anagrams and both are palindromes"))
  end
  it("tests if words are not anagrams and if either is a palindrome") do
    expect("mom".anagram_handler("word")).to(eq("'Mom' and 'word' aren't anagrams but 'mom' is a palindrome"))
  end
  it("tests if words are not anagrams and if both are palindromes") do
    expect("mom".anagram_handler("word")).to(eq("'Mom' and 'dad' aren't anagrams but both are palindromes"))
  end
  it("tests if words are palindromes of each other") do
    expect("Meg".anagram_handler("gem")).to(eq("'Meg' and 'gem' are anagrams and palindromes of each other"))
  end
  it("tests if words are indeed words") do
    expect("ggmbph".anagram_handler("mbpghg")).to(eq("enter words, you fool"))
  end
  it("tests if words are antigrams") do
    expect("art".anagram_handler("mall")).to(eq("'Art' and 'mall' are antigrams"))
  end
  it("can handle multi-word input") do
    expect("art mall".anagram_handler("genders")).to(eq("'Art mall' and 'genders' are antigrams"))
  end
end
