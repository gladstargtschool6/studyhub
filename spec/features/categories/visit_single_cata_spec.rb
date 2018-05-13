require "rails_helper"

RSpec.feature "Visit single category page", :type => :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  scenario "User goes to a single category from the home page", js: true do
    category
    visit root_path
    find("a.interested").click
    expect(page).to have_link("See all questions")
    click_on "See all questions"
    expect(page).to have_link('question 1')
  end


end