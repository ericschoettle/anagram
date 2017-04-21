require('rspec')
require('./lib/anagram')

describe('String.anagram') do
  it("tests if a word is an anagram") do
    expect("hustling".anagram_handler("sunlight")).to(eq("'Hustling' and 'sunlight' are anagrams"))
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
  it("tests if words are palindromes of each other") do
    expect("Star".anagram_handler("rats")).to(eq("'Star' and 'rats' are anagrams and are palindromes of each other"))
  end
  it("tests if words are antigrams") do
    expect("art".anagram_handler("spool")).to(eq("'Art' and 'spool' are antigrams"))
  end
  it("tests if words are not anagrams or antigrams") do
    expect("Eve".anagram_handler("ewe")).to(eq("'Eve' and 'ewe' are neither anagrams nor antigrams but both are palindromes"))
  end
  it("can handle multi-word input") do
    expect("dormitory".anagram_handler("dirty room")).to(eq("'Dormitory' and 'dirty room' are anagrams"))
  end
  it("tests if words are indeed words") do
    expect("ggmbph".anagram_handler("word")).to(eq("Ggmbph isn't a word!"))
  end
  it("tests if two words are teh same") do
    expect("word".anagram_handler("word")).to(eq("Trying to be clever, putting in the same word twice..."))
  end
end
