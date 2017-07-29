require 'date'
require 'rails_helper'

RSpec.feature "user goes to course show" do
  scenario "and sees active course" do
    course = create(:course)

    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.price)
    expect(page).to have_content(course.image)
    expect(page).to have_button("Add to Cart")
  end

  scenario "and sees retired course" do
    course = create(:course, retired: DateTime.now)

    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.price)
    expect(page).to have_content(course.image)
    expect(page).to_not have_button("Add to Cart")
    expect(page).to have_button("Course Retired")
  end
end
