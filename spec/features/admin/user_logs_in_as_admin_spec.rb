require 'rails_helper'

RSpec.feature "user logs in as admin" do
  scenario "and is redirected to admin/dashboard" do
    user = create(:user, role: 1, password: "password")
    expect(user.admin?).to be_truthy
    expect(user.role).to eq("admin")
    visit('/')
    click_on "Login"
    fill_in "session[username]", with: "#{user.username}"
    fill_in "session[password]", with: "#{user.password}"
    click_button "Login"
    expect(current_path).to eq('/admin/dashboard')
  end
end
