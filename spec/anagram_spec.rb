require('rspec')
require('./lib/anagram')

describe('String.anagram') do
  it("tests if a word is an anagram") do
    expect("star".anagram("rats")).to(eq(true))
  end
  it("is case insensitive") do
    expect("Meg".anagram("gem")).to(eq(true))
  end
  it("tests if words are palindromes of themselves") do
    expect("mom".anagram("dad")).to(eq("these words aren't anagrams, but 'mom' and 'dad' are both palindromes!"))
  end
  it("tests if words are palindromes of each other") do
    expect("Meg".anagram("gem")).to(eq("these words are palindromes of each other"))
  end
  it("tests if words are indeed words") do
    expect("ggmbph".anagram("mbpghg")).to(eq("enter words, you fool!"))
  end
  it("tests if words are antigrams") do
    expect("art".anagram("mall")).to(eq("'art' and 'mall' are antigrams"))
  end
  it("can handle multi-word input") do
    expect("art mall".anagram("genders")).to(eq("'art mall' and 'genders' are antigrams"))
  end
end
