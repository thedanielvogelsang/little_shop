require 'date'
require 'rails_helper'

RSpec.feature 'user goes to course index' do
  scenario 'and sees all active courses' do
    category = create(:category)
    course = create(:course, category: category)
    course2 = create(:course, category: category)

    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course2.title)

    expect(page).to have_content(course.description)
    expect(page).to have_content(course2.description)
  end

  scenario 'and cannot see inactive courses' do
    category = create(:category)
    timestamp = DateTime.now
    course = create(:course, category: category)
    course2 = create(:course, category: category, status: 1)

    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to_not have_content(course2.title)
  end
end
