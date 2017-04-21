require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('anagram path', :type => :feature) do
  it "tests if two words are anagrams, antigrams, and/or palindromes" do
    visit('/')
    fill_in('word1', :with => 'otto')
    fill_in('word2', :with => 'toot')
    click_button('Anagram?')
    expect(page).to have_content("Otto' and 'toot' are anagrams and both are palindromes")
  end
end
