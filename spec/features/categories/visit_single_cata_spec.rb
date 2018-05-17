require "rails_helper"

RSpec.feature "Visit single category page", :type => :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  scenario "User goes to a single category from the home page", js: true do
    category
    visit '/categories'
    page.all('li').map { |li| li.find('a')['href']  }
    # find('/categories/5', text: 'See all questions').click
    page.should have_selector(:link_or_button, 'Delete')
  end


end