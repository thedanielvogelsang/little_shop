require 'date'
require 'rails_helper'

RSpec.feature 'user goes to course show' do
  scenario 'and sees active course' do
    course = create(:course)

    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.price)
    expect(page).to have_xpath("//img[contains(@src,'#{course.image}')]")
    expect(page).to have_button('Add to Cart')
  end

  scenario 'and sees inactive course' do
    course = create(:course, status: 1)

    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.price)
    expect(page).to have_xpath("//img[contains(@src,'#{course.image}')]")
    expect(page).to_not have_button('Add to Cart')
    expect(page).to have_button('Course Inactive')
  end
end
