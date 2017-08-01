require 'rails_helper'

RSpec.feature "user logs in as admin" do
  before(:each) do
    @user = User.create(username: "DVOG", first_name: "Dan", last_name: "Vog", password: "password", role: 1, email: "dvog@gmail.com")
    expect(@user.admin?).to be_truthy
    expect(@user.role).to eq("admin")
    visit('/')
    click_on "Login"
  end
  context "and after entering admin username and password" do
    scenario "is redirected to admin/dashboard" do
      fill_in "session[username]", with: "#{@user.username}"
      fill_in "session[password]", with: "#{@user.password}"
      click_button "Login"
      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_link("Edit User Info")
    end
  end

  context "and clicks on edit user info" do
    scenario "and, after editing their username, sees that info change on dashboard" do
      fill_in "session[username]", with: "#{@user.username}"
      fill_in "session[password]", with: "#{@user.password}"
      click_button "Login"
      click_link("Edit User Info")
      save_and_open_page
    end
  end
end
