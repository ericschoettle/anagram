require('rspec')
require('./lib/anagram')

describe('String.anagram') do
  it("tests if a word is an anagram") do
    expect("star".anagram_handler("rats")).to(eq(true))
  end
  it("is case insensitive") do
    expect("Meg".anagram_handler("gem")).to(eq(true))
  end
  it("tests if words are palindromes of themselves") do
    expect("mom".anagram_handler("dad")).to(eq("these words aren't anagrams, but 'mom' and 'dad' are both palindromes!"))
  end
  it("tests if words are palindromes of each other") do
    expect("Meg".anagram_handler("gem")).to(eq("these words are palindromes of each other"))
  end
  it("tests if words are indeed words") do
    expect("ggmbph".anagram_handler("mbpghg")).to(eq("enter words, you fool!"))
  end
  it("tests if words are antigrams") do
    expect("art".anagram_handler("mall")).to(eq("'art' and 'mall' are antigrams"))
  end
  it("can handle multi-word input") do
    expect("art mall".anagram_handler("genders")).to(eq("'art mall' and 'genders' are antigrams"))
  end
end
