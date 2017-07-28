require 'rails_helper'

describe "User sees all items for a single category" do
  scenario "a user sees all the courses under a category" do
    category_1 = create(:category)
    course_1   = create(:course, category: category_1)
    course_2   = create(:course, category: category_1)

    category_2 = create(:category)
    course_3   = create(:course, category: category_2)
    course_4   = create(:course, category: category_2)

    visit "/#{category_1.slug}"


    expect(current_path).to eq("/#{category_1.slug}")
    expect(page).to have_content("MyCourse")
    expect(page).to have_content("Course Details")

    visit "/#{category_2.slug}"

    expect(current_path).to eq("/#{category_2.slug}")
    expect(page).to have_content("#{course_3.title}")
    expect(page).to have_content("Course Details")
  end
end
