require "rails_helper"

# RSpec.feature "Login", :type => :feature do
#   let(:user) { create(:user) }

#   scenario 'user navigates to the login page and succesfully logs in', js: true do
#     user
#     visit new_user_session_path
#     find('nav a', text: 'Login').click
#     fill_in 'user[email]', with: user.email
#     fill_in 'user[password]', with: user.password
#     find('.login-button').click
#     expect(page).to have_link("All categories")
#   end

# end

describe "the signin process", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/categories'
    find('a', text: 'Login').click
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    click_button 'Log in'
    page.assert_selector(:link, nil, href: '/categories')
  end
end