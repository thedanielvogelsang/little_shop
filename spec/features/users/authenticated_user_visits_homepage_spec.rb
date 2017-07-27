require 'rails_helper'

RSpec.feature "authenticated user visits homepage" do
  before(:each) do
    @user = create(:user, username: "DVOG", password: "password")
  end
  context "and at first" do
    it "sees the link login" do
    visit("/")
    expect(page).to have_link("Login")
    click_link("Login")
    expect(current_path).to eq("/login")
    expect(page).to have_css("//form")
    within ('//form') do
      expect(page).to have_content("Username:")
      expect(page).to have_content("Password:")
      end
    end
  end

  context "and after logging in successfully" do
    it "sees a users dashboard page" do
      visit('/')
      click_link("Login")

      fill_in "session[username]", with: "DVOG"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(current_path).to eq('/dashboard')
      expect(current_page).to have_content(@user.username)
      expect(current_page).to have_content(@user.first_name)
      expect(current_page).to have_content(@user.last_name)
      expect(current_page).to have_content(@user.email)
      expect(current_page).to have_content("Logged in as SOME_USER")
    end
  end
end
