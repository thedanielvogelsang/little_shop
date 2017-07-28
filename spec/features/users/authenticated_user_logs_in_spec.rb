require 'rails_helper'

RSpec.feature "authenticated user logs in" do
  before(:each) do
    @user = create(:user, username: "DVOG", password: "password")
  end
  context "and after logging in successfully" do
    it "sees a users dashboard page" do
      visit('/')
      expect(page).to have_content("Login")
      click_link("Login")

      fill_in "session[username]", with: "DVOG"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(current_path).to eq('/dashboard')

      visit('/')
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
    
  context "and after logging in successfully" do
    it "can logout" do
      visit('/')
      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("#{user.username.capitalize}")
      expect(page).to have_content("Goodbye")
    end
  end
end
