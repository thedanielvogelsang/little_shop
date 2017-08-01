require 'rails_helper'

describe 'User sees all items for a single category' do
  scenario 'a user sees all the courses under a category' do
    category1 = create(:category)
    course1   = create(:course, category: category1)
    course2   = create(:course, category: category1)

    category2 = create(:category)
    course3   = create(:course, category: category2)
    course4   = create(:course, category: category2)

    visit "/#{category1.slug}"

    expect(current_path).to eq("/#{category1.slug}")
    expect(page).to have_content("#{course1.title}")
    expect(page).to have_content("#{course1.description}")
    expect(page).to have_content("#{course2.title}")
    expect(page).to have_content("#{course2.description}")

    visit "/#{category2.slug}"

    expect(current_path).to eq("/#{category2.slug}")
    expect(page).to have_content("#{course3.title}")
    expect(page).to have_content("#{course3.description}")
    expect(page).to have_content("#{course4.title}")
    expect(page).to have_content("#{course4.description}")
  end
end
