require 'rails_helper'

describe "Admin visits admin/courses" do
  it "admin sees a table with title, description, and status for all courses" do
    admin = create(:user, role: 1)
    course_1 = create(:course)
    course_2 = create(:course)
    course_3 = create(:course, status: 1)
    course_4 = create(:course, status: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path(admin)

    click_on "View All Items"

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content(course_1.title)
    expect(page).to have_content(course_2.description)
    expect(page).to have_content(course_3.image)
    expect(page).to have_content(course_4.status)
    expect(page).to have_link(course_1.title, href: course_path(course_1))

    expect(page).to have_content("Edit")
  end
end



# As an Admin When I visit "/admin/dashboard" Then I should see a link for
# viewing all items And when I click that link Then my current path should be
 # "/admin/items" Then I should see a table with all items (active and inactive)
 #  And each item should have:
#
# A thumbnail of the image
# Title that links to the item
# Description
# Status
# Actions (Edit)
