# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_exception, false)
#
# describe('coin path', :type => :feature) do
#   it "gives a number of cents and returns change" do
#     visit('/')
#     fill_in('change', :with => '92')
#     click_button('Count')
#     expect(page).to have_content('3 quarters, 1 dime, 1 nickel, 2 pennies')
#   end
# end
