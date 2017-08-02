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
    fill_in "course[image]", with: "https://www.smashingmagazine.com/images/introduction-to-rails/rails.jpg"
    select "active", from: "Status"

    click_button "Create Course"

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content("Ruby on Rails")
  end
end



# An item must have a title, description and price.
# An item must belong to at least one category.
# The title and description cannot be empty.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
# The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
