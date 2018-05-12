require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with GitHub")
    click_link "/users/auth/github"
    expect(page).to have_content("Jesse Spevack")
    expect(page).to have_link("Logout")
    end

  def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "12345678910",
      info: {
        email: "jesse@mountainmantechnologies.com",
        first_name: "Jesse",
        last_name: "Spevack"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
    })
  end
end