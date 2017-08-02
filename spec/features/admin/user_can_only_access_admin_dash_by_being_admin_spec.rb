require 'rails_helper'

RSpec.feature "user visits homepage" do
  context "and logs in as a registered admin" do
    it "and after logging in sees an Admin Dashboard header" do
      user = create(:user, role: 1, password: "password")
      expect(user.admin?).to be_truthy
      expect(user.role).to eq("admin")
      visit('/')
      click_on "Login"
      fill_in "session[username]", with: "#{user.username}"
      fill_in "session[password]", with: "#{user.password}"
      click_button "Login"
      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content("Admin Dashboard")
    end
  end
  context "and logs in as a registered user" do
    it "and can't visit admin dashboard" do
      user = create(:user, password: "password")
      expect(user.admin?).to be false
      expect(user.role).to eq("default")
      visit('/')
      click_on "Login"
      fill_in "session[username]", with: "#{user.username}"
      fill_in "session[password]", with: "#{user.password}"
      click_button "Login"
      expect(current_path).to eq('/dashboard')
      expect(page).to_not have_content("Admin Dashboard")
      visit('/admin/dashboard')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
  context "as an unregistered user" do
    it "and can't visit /admin/dashboard" do
      visit('/')
      visit('/admin/dashboard')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
