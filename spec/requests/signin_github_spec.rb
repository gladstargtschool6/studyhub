require 'rails_helper'

# RSpec.feature "Sign in with GitHub", :type => :feature do
#   let(:user) { create(:user) }

#   scenario 'user navigates to the sign in with github page and succesfully sign in', js: true do
#     user
#     visit root_path
#     find('nav a', text: 'Sign in with GitHub').click
#     find('.login-button').click
#     expect(page).to have_selector('#user-settings')
#   end

# end

# RSpec.describe "omniauth github", :type => :request do
#     include Capybara::DSL
#   it "should have a return UID of 1234567" do
#     find_button('sign in with GitHub').click
#     # 'users/auth/github'
#     request.env["omniauth.auth"][:uid].should == '1234567'
#   end
# end

# RSpec.describe "omniauth github", :type => :request do
#   it "should have a return UID of 1234567" do
#     click_link '/users/auth/github'
#     request.env["omniauth.auth"][:uid].should == '1234567'
#   end
  # background do
  #   set_omniauth()
  #   click_link_or_button 'Sign in with GitHub'
  # end
