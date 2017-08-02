require 'rails_helper'

describe "Admin can create new items" do
  it "and it is redirected to the item's show page" do
    admin = create(:user, role: 1)
    category = create(:category, title: "Coding")

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path(admin))

    click_link "Add new item"

    expect(current_path).to eq(new_admin_course_path)

    select "Coding", from: "course_category_id"

    fill_in "course[title]", with: "Ruby on Rails"
    fill_in "course[description]", with: "Best Rails Course Online"
    fill_in "course[price]", with: 55.99
    page.attach_file("image", Rails.root + "app/assets/images/course_default.png")
    select "active", from: "Status"

    click_button "Create Course"

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content("Ruby on Rails")
  end
end
