require 'rails_helper'

describe "Admin visits admin/courses" do
  it "admin sees a table with title, description, and status for all courses" do
    admin = create(:user, role: 1)
    course_1 = create(:course)
    course_2 = create(:course)
    course_3 = create(:course, status: 0)
    course_4 = create(:course, status: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path(admin)

    click_on "View All Items"

    expect(current_path).to eq(admin_courses_path)
    expect(page).to have_content(course_1.title)
    expect(page).to have_content(course_2.description)
    expect(page).to have_css("img[src*='#{course_3.image}']")
    expect(course_3.status).to eq("active")
    expect(course_4.status).to eq("retired")
    expect(page).to have_link(course_1.title, href: course_path(course_1))

    expect(page).to have_content("Edit")
  end
end
