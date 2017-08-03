require 'rails_helper'

describe "Admin can create new items" do
  it "and it is redirected to the item's show page" do
    admin = create(:user, role: 1)
    category = create(:category, title: "Coding")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_link "Add new course"

    expect(current_path).to eq(new_admin_course_path)

    select "Coding", from: "course_category_id"

    fill_in "course[title]", with: "Ruby on Rails"
    fill_in "course[description]", with: "Best Rails Course Online"
    fill_in "course[price]", with: 55.99
    fill_in "course[image]", with: "http://robohash.org/mike"
    select "active", from: "Status"

    click_button "Create Course"

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content("Ruby on Rails")
    expect(page).to have_content("Best Rails Course Online")
  end
end
