require 'date'
require 'rails_helper'

RSpec.feature "user goes to course index" do
  scenario "and sees all active courses" do
    category = create(:category)
    course = create(:course, category: category)
    course2 = create(:course, category: category)
    course3 = create(:course, category: category)
    course4 = create(:course, category: category)
    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course2.title)
    expect(page).to have_content(course3.title)
    expect(page).to have_content(course4.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course2.description)
    expect(page).to have_content(course3.description)
    expect(page).to have_content(course4.description)
  end

  scenario "and cannot see retired courses" do
    category = create(:category)
    timestamp = DateTime.now
    course = create(:course, category: category)
    course2 = create(:course, category: category)
    course3 = create(:course, category: category, retired: timestamp)
    course4 = create(:course, category: category, retired: timestamp)

    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course2.title)
    expect(page).to_not have_content(course3.title)
    expect(page).to_not have_content(course4.title)
  end
end
